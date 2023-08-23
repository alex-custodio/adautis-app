import 'package:flutter/material.dart';

import '../../domain/dados.dart';

class ContainerEnsino extends StatefulWidget {
  final Dados dados;

  const ContainerEnsino({super.key, required this.dados});

  @override
  State<ContainerEnsino> createState() => _ContainerEnsinoState();
}

class _ContainerEnsinoState extends State<ContainerEnsino> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9932CC),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              widget.dados.imagem,
            ),
          ),
          Text(widget.dados.ensino,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
