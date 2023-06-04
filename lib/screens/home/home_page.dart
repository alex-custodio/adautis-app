import 'package:adautisapp/components/bottom_nav_bar.dart';
import 'package:adautisapp/components/floating_chat_button.dart';
import 'package:flutter/material.dart';

import 'custom_clip.dart';
import 'custom_clip_decoracao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: [
            buildContainerTitulo(),
            // buildContainerDecoracao(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(25),
              child: buildBody(),
            )
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: ChatButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  ClipPath buildContainerDecoracao() {
    return ClipPath(
      clipper: CustomClipDecoracao(),
      child: Container(
        height: 160,
        color: Colors.purple.withOpacity(0.6),
      ),
    );
  }



  

  ClipPath buildContainerTitulo() {
    return ClipPath(
      clipper: CustomClipTitulo(),
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFBA55D3),
              Color(0xFF9932CC),
              Color(0XFFA020F0)
            ]
          )
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 50, left: 40),
          child: Text(
            "Descubra!",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Text(
          "Matérias",
          style: TextStyle(
            fontSize: 28,

          ),
        ),
        SizedBox(height: 24,),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/portugues.png"),
            ),
            title: Text(
              "Português",
              style: TextStyle(
                fontSize: 20
              ),
            ),
          visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/matematica.png"),
            ),
            title: Text(
              "Matemática",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ciencias.png"),
            ),
            title: Text(
              "Ciências",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/historia.png")
            ),
            title: Text(
              "História",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/geografia.png")
            ),
            title: Text(
              "Geografia",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/educacao-fisica.png"),
            ),
            title: Text(
              "Educação Física",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        ),
        SizedBox(height: 6),
        Ink(
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage:AssetImage("assets/images/artes.png"),
            ),
            title: Text(
              "Artes",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            visualDensity: VisualDensity(horizontal: 3),
            onTap: (){},
          ),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
              )
            ]
          ),
        )
      ],
    );
  }
}

