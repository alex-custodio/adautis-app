import 'package:adautisapp/domain/atividade_adaptada.dart';

class AtividadeAdaptadaDao {
  var listAtividades = [
    AtividadeAdaptada(
      title: "Português",
      imageLink:
          "assets/images/foto_portugues.jpeg",
    ),
    AtividadeAdaptada(
      title: "Matemática",
      imageLink:
          "assets/images/foto_matematica.jpeg",
    ),
    AtividadeAdaptada(
        title: "Direito Penal",
        imageLink:
            "assets/images/foto_direito_penal.jpeg")
  ];

  Future<List<AtividadeAdaptada>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return listAtividades;
  }
}
