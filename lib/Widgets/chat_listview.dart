import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  final String text;
  final String sender;
  final String currentuser;
  const ChatListView({
    Key? key,
    required this.text,
    required this.sender,
    required this.currentuser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool check = currentuser == sender;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            check ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: check
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white60, offset: Offset(0, 1), blurRadius: 5)
              ],
            ),
            child: Material(
              borderRadius: check
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
