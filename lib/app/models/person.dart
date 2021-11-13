class Person {
  String? birthday;
  String? knownForDepartment;
  int? id;
  String? name;
  List<String>? alsoKnownAs;
  int? gender;
  String? biography;
  String? imdbId;
  double? popularity;
  String? placeOfBirth;
  String? profilePath;
  bool? adult;

  Person(
      {this.birthday,
      this.knownForDepartment,
      this.id,
      this.name,
      this.alsoKnownAs,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath,
      this.adult,
      this.imdbId});

  Person.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    id = json['id'];
    imdbId = json['imdb_id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthday'] = birthday;
    data['known_for_department'] = knownForDepartment;
    data['id'] = id;
    data['name'] = name;
    data['also_known_as'] = alsoKnownAs;
    data['gender'] = gender;
    data['biography'] = biography;
    data['popularity'] = popularity;
    data['imdb_id'] = imdbId;
    data['place_of_birth'] = placeOfBirth;
    data['profile_path'] = profilePath;
    data['adult'] = adult;
    return data;
  }
}
