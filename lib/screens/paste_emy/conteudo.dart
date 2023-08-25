import 'package:flutter/material.dart';

import '../../domain/info.dart';

class Conteudo extends StatefulWidget {
  final Informacao info;

  const Conteudo({
    super.key,
    required this.info
  });

  @override
  State<Conteudo> createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  Informacao get informacao => widget.info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        const Text(
          "Descrição",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 14),
        Text(
          informacao.descricao,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            const Text('Matéria: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              informacao.nomeMateria,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            const Text('Questões: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("${informacao.numQuestoes}", style: const TextStyle(fontSize: 20)),
          ],
        ),
        Center(
          child: Column(
            children: [
              const Text(
                "Imagem",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 14),
              Image(
                image: AssetImage(informacao.imagem),
                height: 400,
              )
            ],
          ),
      ),
    ]);
  }
}