class MovieVideos {
  late int id;
  late List<Results> results;

  MovieVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  late String iso6391;
  late String iso31661;
  late String name;
  late String key;
  late String site;
  late int size;
  late String type;
  late bool official;
  late String publishedAt;
  late String id;

  Results.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_639_1'] = iso6391;
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    data['key'] = key;
    data['site'] = site;
    data['size'] = size;
    data['type'] = type;
    data['official'] = official;
    data['published_at'] = publishedAt;
    data['id'] = id;
    return data;
  }
}