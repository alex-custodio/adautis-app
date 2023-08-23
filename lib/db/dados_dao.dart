import '../domain/dados.dart';

class DadosDao {
  var lista = const [
    Dados(imagem: "assets/images/logo1.jpeg", ensino: "Ensino Infantil"),
    Dados(imagem: "assets/images/logo2.jpeg", ensino: "Ensino Fundamental"),
    Dados(imagem: "assets/images/logo3.jpeg", ensino: "Ensino Médio"),
  ];

  Future<List<Dados>> findAll() async {
    await Future.delayed(const Duration(seconds: 5));
    return lista;
  }
}
