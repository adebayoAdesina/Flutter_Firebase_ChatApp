import 'package:firebase_chat_app/Resources/auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
   static const String id = '/';
  const ChatScreen({ Key? key }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    AuthMethods authMethods = AuthMethods();
    authMethods.getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}