class MovieModel {
  int? id;
  String? title;
  String? posterpath;

  MovieModel({this.id, this.title, this.posterpath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      posterpath: json['poster_path']
    );
  }
}