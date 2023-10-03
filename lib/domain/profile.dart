class Perfil {
  final String id;
  final String username;
  final String fullName;
  final String imageLink;

  Perfil({
    required this.id,
    required this.username,
    required this.fullName,
    required this.imageLink,
  });

  Perfil.fromJson(Map<String, dynamic> json)
    : id = json['id'].toString(),
      username = json['username'].toString(),
      fullName = json['full_name'].toString(),
      imageLink = json['image_link'].toString();
}
