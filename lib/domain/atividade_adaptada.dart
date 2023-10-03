class AtividadeAdaptada {
  final String id;
  final String description;
  final String teachingSegmnet;
  final String subject;
  final String title;
  final String imageLink;

  AtividadeAdaptada({
    required this.id,
    required this.description,
    required this.teachingSegmnet,
    required this.subject,
    required this.title,
    required this.imageLink,
  });

  AtividadeAdaptada.fromJson(Map<String, dynamic> json)
    : id = json['id'].toString(),
      description = json['description'].toString(),
      teachingSegmnet = json['teaching_segment'].toString(),
      subject = json['subject'].toString(),
      title = json['title'].toString(),
      imageLink = json['image_link'].toString();
}
