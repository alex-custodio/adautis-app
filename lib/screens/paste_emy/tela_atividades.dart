import 'package:flutter/material.dart';

import '../../db/informacao_dao.dart';
import 'conteudo.dart';


class TelaAtividades extends StatefulWidget {
  const TelaAtividades({super.key});

  @override
  State<TelaAtividades> createState() => _TelaAtividadesState();
}

class _TelaAtividadesState extends State<TelaAtividades> {
  Future listaFutura = InformacaoDao().findAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFc854ff),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFc854ff),
        elevation: 0,
        title: const Text(
          'Alfabetização',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView(children: [
          buildIcon(),
          const SizedBox(height: 24),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: 700,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:const BorderRadius.vertical(top: Radius.circular(30))),
                  padding: const EdgeInsets.all(24),
                  child: FutureBuilder(
                    future: listaFutura,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        var lista = snapshot.data!;
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: lista.length,
                          itemBuilder: (context, index) {
                            return Conteudo(info: lista[index]);
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator(color: Color(0xFFc854ff),));
                    },
                  ),
                )
              ),
              buildContainerAmarelo(),
            ],
          )
        ]),
      ),
    );
  }

  buildContainerAmarelo() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFfed363)),
        child: const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
          child: Text(
            "Dados da atividade adaptada",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Center buildIcon() {
    return const Center(
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/Portugues.png"),
        radius: 80,
      ),
    );
  }
}
