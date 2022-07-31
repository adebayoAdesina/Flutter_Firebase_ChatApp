import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/Resources/auth.dart';
import 'package:firebase_chat_app/Util/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id = '/';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  AuthMethods authMethods = AuthMethods();
  String? message;
  String? sender;

  @override
  void initState() {
    super.initState();
    currentUser();
  }

  void currentUser() async {
    sender = await authMethods.getCurrentUser();
  }

  void sendMessage() {
    // to add directly to the collection
    _firebaseFirestore.collection('messages').add(
      {
        'text': message,
        'sender': sender,
      },
    );
  }

/* to get data without using stream*/
  // void getMessages() async {
  //   // final messages = await _firebaseFirestore.collection('messages').get();
  //   // for (var message in messages.docs) {
  //   //   print(message.data);
  //   // }
  // }

/* to get steam data using firebase query snapshot*/
  void getMessages() async {
    await for (var message
        in _firebaseFirestore.collection('messages').snapshots()) {
      for (var snap in message.docs) {
        print(snap);
      }
    }
  }

  void signOutUser() {
    AuthMethods authMethods = AuthMethods();
    authMethods.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Hero(
              tag: 'logo',
              child: Image(
                image: AssetImage('assets/images/R.png'),
                width: 20,
              ),
            ),
            Text('Chat'),
          ],
        ),
        actions: [
          IconButton(onPressed: () => signOutUser(), icon: Icon(Icons.close)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection('messages').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            else {
              final data = snapshot.data!.docs;
              List messageWidgets = [];
              for (var item in data) {
                messageWidgets.add(item);
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: kWhiteColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              message = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Type here',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: (() => sendMessage()),
                          child: Text('Send'),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
