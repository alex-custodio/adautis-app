import 'package:flutter/material.dart';

import '../screens/chat/chat_screen.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.chat_outlined),
        backgroundColor: Colors.purple,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
        },
      );;
  }
}