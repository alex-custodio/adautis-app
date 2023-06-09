import 'package:adautisapp/screens/home/home_page.dart';
import 'package:adautisapp/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => value == 0 ? const HomePage() : const ProfilePage()));
        // Ao invés do ChatPage aqui deve estar ProfilePage
      },
      selectedItemColor: Color(0xFF9932CC),
      iconSize: 30,
      items: const [
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
  }
}
