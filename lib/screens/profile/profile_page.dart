import 'package:adautisapp/components/bottom_nav_bar.dart';
import 'package:adautisapp/components/floating_chat_button.dart';
import 'package:adautisapp/db/atividade_adaptada_dao.dart';
import 'package:adautisapp/domain/atividade_adaptada.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<AtividadeAdaptada>> listAtividades = AtividadeAdaptadaDao().findAll();

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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
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
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fHww&w=1000&q=80"),
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

  buildProfileTextName(String nome) {
    return Text(
      nome,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  buildProfileTextUsername(String nomeUsuario) {
    return Text(
      nomeUsuario,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
    );
  }

  buildProfileButton(String texto, Color color) {
    return SizedBox(
      height: 30,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: color, elevation: 1, padding: const EdgeInsets.all(8)),
        child: Text(
          texto,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }

  buildTotalCounterText() {
    return Center(
      child: Column(
        children: [
          FutureBuilder(
            future: listAtividades,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final listAtividadesFuture = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "${listAtividadesFuture!.length}",
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
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }

  buildActivitiesGridView() {
    return SizedBox(
        height: 425,
        child: FutureBuilder(
          future: listAtividades,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final listAtividadesFuture = snapshot.data;
              return GridView.builder(
                itemCount: listAtividadesFuture!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return buildActivityContainer(listAtividadesFuture.elementAt(index).imageLink,
                      listAtividadesFuture.elementAt(index).title);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  buildActivityContainer(String imageLink, String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('open');
          },
          onLongPress: () {
            print('options');
          },
          child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(256), topRight: Radius.circular(256)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(54)),
              child: Image.network(
                imageLink,
                width: 150,
                height: 150,
              ),
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 30,
              width: 113,
              decoration: const BoxDecoration(
                  color: Color(0XFFA020F0),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16))),
            ),
            Text(
              title,
              style:
                  const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
