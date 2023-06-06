import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            body: Column(
                children: [
                    Stack(
                        children: [
                            buildPurpleBox(),
                            Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: buildProfileCentralizedContainer("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80", "Fulana de Tal", "@fulaninha123"),
                            ),
                        ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                            children: [
                                buildListTile(const Color(0XFFA020F0), Icons.category_outlined, "Atividades Realizadas"),
                                const SizedBox(height: 16),
                                buildListTile(const Color(0XFFA020F0), Icons.construction_outlined, "Configurações"),
                                const SizedBox(height: 16),
                                buildListTile(Colors.red, Icons.logout, "Sair"),
                                ],
                            ),
                        ),
                    ],
                ),
            ),
        );
    }

    buildListTile(Color c, IconData i, String texto) {
        return ListTile(
            leading: CircleAvatar(
                backgroundColor: c,
                radius: 20,
                child: Icon(i),
            ),
            title: Text(
                texto,
                style: const TextStyle(
                fontWeight: FontWeight.w500,
                ),
            ),
            onTap: () {},
        );
    }

  buildAppBar(){
    return AppBar(
        backgroundColor:  const Color(0XFFA020F0),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
        ),
        title: const Padding(
            padding: EdgeInsets.only(top: 36),
            child: Text(
                    "PROFILE"
                ),
            ),
        elevation: 0,
    );
  }

  buildPurpleBox() {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0XFFA020F0),
        ),
        height: 200,
    );
  }

  buildProfileCentralizedContainer(String imageURL, String nome, String usuario){
    return Center(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 7.0,
                    blurRadius: 5.0,
                    offset: Offset(0, 3),
                ),
                ],
            ),
            height: 250,
            width: 350,
            child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
            children: [
                CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 65,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                    radius: 60,
                    ),
                ),
                Text(
                    nome,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                    ),
                ),
                const SizedBox(height: 6),
                Text(
                    usuario,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                            ),
                        ),
                    ],
                ),
            ),
        ),
    );
  }
}