import 'package:flutter/material.dart';

import '../../../../../components/bottom_nav_bar.dart';
import '../../../../../components/floating_chat_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9932CC),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [buildTitulo(), buidContainerMaterias()],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 25, right: 25),
                  child: builMaterias(),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: ChatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Column builMaterias() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Escolha a matéria",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Portugues.png"),
              radius: 24,
            ),
            title: Text("Lingua Portuguesa"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/matematica.png"),
              radius: 24,
            ),
            title: Text("Matemática"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/ciencias.png"),
              radius: 24,
            ),
            title: Text("Ciências"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/historia.png"),
              radius: 24,
            ),
            title: Text("História"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/geografia.png"),
              radius: 24,
            ),
            title: Text("Geografia"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/educacao-fisica.png"),
              radius: 24,
            ),
            title: Text("Educação Física"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
        SizedBox(height: 16),
        Ink(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/artes.png"),
              radius: 24,
            ),
            title: Text("Artes"),
            subtitle: Text("5 textos"),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
              onPressed: () {},
            ),
            visualDensity: VisualDensity(vertical: 4),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Ink buidContainerMaterias() {
    return Ink(
      height: 950,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45))),
    );
  }

  Padding buildTitulo() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Informe-se",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ],
      ),
    );
  }
}



