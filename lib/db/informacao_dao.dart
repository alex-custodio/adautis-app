import '../domain/info.dart';

class InformacaoDao{
  var lista = const [
    Informacao(
      descricao: "O objetivo dessa atividade é desenvolver de forma lúdica o processo de alfabetização", 
      nomeMateria: "Português", 
      numQuestoes: 1, 
      imagem: "assets/images/atividade.png"
    ),
    Informacao(
      descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra, sem quis congue rutrum, dui velit ultricies diam, euismod dictum dolor nisl molestie libero. Suspendisse tincidunt orci ut risus malesuada vehicula. Nunc porttitor ornare eleifend.", 
      nomeMateria: "Matemática", 
      numQuestoes: 1, 
      imagem: "assets/images/atividade.png"
    ),
    Informacao(
      descricao: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque viverra, sem quis congue rutrum, dui velit ultricies diam, euismod dictum dolor nisl molestie libero. Suspendisse tincidunt orci ut risus malesuada vehicula. Nunc porttitor ornare eleifend.", 
      nomeMateria: "Direito Penal", 
      numQuestoes: 1, 
      imagem: "assets/images/atividade.png"
    ),
  ];

  Future<List<Informacao>> findAll() async{
    return lista;
  }
}