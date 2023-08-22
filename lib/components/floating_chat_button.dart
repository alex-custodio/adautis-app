import 'package:flutter/material.dart';

import '../../../screens/chat/chat_screen.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: const Color(0xFF9932CC),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
        },
        child: const Icon(Icons.chat_outlined),
      );
  }
}