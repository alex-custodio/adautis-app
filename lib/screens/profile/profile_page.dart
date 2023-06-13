import 'package:adautisapp/components/bottom_nav_bar.dart';
import 'package:adautisapp/components/floating_chat_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int counter = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: buildAppBar(),
            bottomNavigationBar: const BottomNavBar(),
            floatingActionButton: const ChatButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: Column(
                children: [
                    const SizedBox(height: 8),
                    buildPersonalInfoContainer(),
                    const SizedBox(height: 24),
                    buildTotalCounterText(),
                    const SizedBox(height: 24),
                    buildActivitiesGridView(),
                ],
            ),
        ),
    );
  }

  buildAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(60),
      child: AppBar(
          title: const Text("Perfil"),
          centerTitle: true,
          backgroundColor: const Color(0XFFA020F0),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25)
              )
          ),
          elevation: 0,
      ),
    );
  }

  buildPersonalInfoContainer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          children: [
              const CircleAvatar(
                  backgroundImage: NetworkImage("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
                  radius: 60,
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    buildProfileTextName("Lohane de HA HA HA"),
                    buildProfileTextUsername("Lohanina123"),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        children: [
                          buildProfileButton("Configurações", const Color(0XFFA020F0)),
                          const SizedBox(width: 16),
                          buildProfileButton("Sair", Colors.red),
                        ],
                      ),
                    )
                ],
              ),
          ],
      ),
    );
  }

    buildProfileTextName(String nome){
        return Text(
            nome,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
        );
    }

    buildProfileTextUsername(String nomeUsuario){
        return Text(
            nomeUsuario,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10
            ),
        );
    }


    buildProfileButton(String texto, Color color){
        return SizedBox(
          height: 30,
          width: 100,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  elevation: 1,
                  padding: const EdgeInsets.all(8)
              ),
              child: Text(
                texto,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),
              ),
          ),
        );
    }

  buildTotalCounterText() {
    return Center(
      child: Column(
        children: [
          Text(
              "$counter",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
              ),
          ),
          const Text(
            "Atividades Adaptadas",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  buildActivitiesGridView(){
    return SizedBox(
      height: 425,  
      child: GridView.builder(
          itemCount: counter,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(256), topRight: Radius.circular(256)),
                    ),
                    child: Image.network(
                        "https://i.pinimg.com/originals/7a/cf/a6/7acfa667529a13e279c69f8f8381c303.jpg",
                        width: 150,
                        height: 150,
                    ),
                ),
                Container(
                    height: 30,
                    width: 113,
                    decoration: const BoxDecoration(
                        color: Color(0XFFA020F0),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
                    ),
                ),
              ],
            );
          },
      ),
    );
  }
}