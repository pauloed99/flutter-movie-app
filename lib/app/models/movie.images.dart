class MovieImages {
  late int id;
  late List<Backdrops> backdrops;
  late List<Backdrops> posters;

  MovieImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['backdrops'] != null) {
      backdrops = <Backdrops>[];
      json['backdrops'].forEach((v) {
        backdrops.add(Backdrops.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <Backdrops>[];
      json['posters'].forEach((v) {
        posters.add(Backdrops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['backdrops'] = backdrops.map((v) => v.toJson()).toList();
    data['posters'] = posters.map((v) => v.toJson()).toList();
    return data;
  }
}

class Backdrops {
  late double aspectRatio;
  late String filePath;
  late int height;
  late int voteAverage;
  late int voteCount;
  late int width;

  Backdrops.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    filePath = json['file_path'];
    height = json['height'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['file_path'] = filePath;
    data['height'] = height;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}
