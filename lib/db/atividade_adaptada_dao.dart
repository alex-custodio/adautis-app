import 'package:adautisapp/domain/atividade_adaptada.dart';

class AtividadeAdaptadaDao {
  var listAtividades = [
    AtividadeAdaptada(
      title: "Português",
      imageLink:
          "https://static.todamateria.com.br/upload/at/iv/atividadesdeportuguessilabas1-cke.jpg",
    ),
    AtividadeAdaptada(
      title: "Matemática",
      imageLink:
          "https://static.todamateria.com.br/upload/or/de/ordemcrescenteeordemdecrescente-cke.jpg",
    ),
    AtividadeAdaptada(
        title: "Direito Penal",
        imageLink:
            "https://imgv2-1-f.scribdassets.com/img/document/63724441/original/e59f0b6002/1687453486?v=1")
  ];

  Future<List<AtividadeAdaptada>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return listAtividades;
  }
}
