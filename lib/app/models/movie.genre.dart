class MovieGenre {
  late List<Genres> genres;

  MovieGenre.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genres'] = genres.map((v) => v.toJson()).toList();
    return data;
  }
}

class Genres {
  late int id;
  late String name;

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}