// ignore_for_file: unnecessary_new, unnecessary_this

class Person {
  String? birthday;
  String? knownForDepartment;
  int? id;
  String? name;
  List<String>? alsoKnownAs;
  int? gender;
  String? biography;
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
      this.adult});

  Person.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    knownForDepartment = json['known_for_department'];
    id = json['id'];
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
    data['birthday'] = this.birthday;
    data['known_for_department'] = this.knownForDepartment;
    data['id'] = this.id;
    data['name'] = this.name;
    data['also_known_as'] = this.alsoKnownAs;
    data['gender'] = this.gender;
    data['biography'] = this.biography;
    data['popularity'] = this.popularity;
    data['place_of_birth'] = this.placeOfBirth;
    data['profile_path'] = this.profilePath;
    data['adult'] = this.adult;
    return data;
  }
}