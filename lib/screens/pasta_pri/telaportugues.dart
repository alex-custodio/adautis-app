import 'package:flutter/material.dart';
import '../../db/dados_dao.dart';
import 'container_ensino.dart';
import '../../domain/dados.dart';

class Telaportugues extends StatefulWidget {
  const Telaportugues({super.key});

  @override
  State<Telaportugues> createState() => _TelaportuguesState();
}

class _TelaportuguesState extends State<Telaportugues> {
  Future<List<Dados>> listafutura = DadosDao().findAll();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: const Color(0xFF9932CC),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: buildComoAdaptar(context),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF9932CC),
      elevation: 0,
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          "Português",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container buildComoAdaptar(BuildContext context) {
    return Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text(
                "Como adaptar?",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9932CC),
                ),
              ),
              const SizedBox(height: 12),
              FutureBuilder(
                future: listafutura,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var lista = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        return TextButton(
                            onPressed: () {
                              aoClicar(context);
                            },
                            child: ContainerEnsino(dados: lista[index]));
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ])));
  }

  aoClicar(BuildContext context) {
    showModalBottomSheet(
        builder: (BuildContext context) {
          return SizedBox(
              height: 400,
              child: Center(
                child: ElevatedButton(
                  child: const Text('close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ));
        },
        context: context);
  }
}
