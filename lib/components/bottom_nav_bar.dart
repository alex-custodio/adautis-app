import 'package:adautisapp/screens/chat/chat_screen.dart';
import 'package:adautisapp/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  int index = 0;
  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        index = value;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => value == 0 ? HomePage() : ChatPage()));
        // Ao invés do ChatPage aqui deve estar ProfilePage
      },
      selectedItemColor: Colors.purple,
      backgroundColor: Colors.grey[100],
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        )
      ],
    );
    ;
  }
}
