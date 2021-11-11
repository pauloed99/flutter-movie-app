class PopularPersons {
  int? page;
  List<Results>? results;
  int? totalResults;
  int? totalPages;

  PopularPersons({this.page, this.results, this.totalResults, this.totalPages});

  PopularPersons.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }
}

class Results {
  String? profilePath;
  bool? adult;
  int? id;
  List<KnownFor>? knownFor;
  String? name;
  double? popularity;

  Results(
      {this.profilePath,
      this.adult,
      this.id,
      this.knownFor,
      this.name,
      this.popularity});

  Results.fromJson(Map<String, dynamic> json) {
    profilePath = json['profile_path'];
    adult = json['adult'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownFor.fromJson(v));
      });
    }
    name = json['name'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_path'] = profilePath;
    data['adult'] = adult;
    data['id'] = id;
    if (knownFor != null) {
      data['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['popularity'] = popularity;
    return data;
  }
}

class KnownFor {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  String? originalTitle;
  List<int>? genreIds;
  int? id;
  String? mediaType;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  double? popularity;
  int? voteCount;
  bool? video;
  double? voteAverage;
  String? firstAirDate;
  List<String>? originCountry;
  String? name;
  String? originalName;

  KnownFor(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.originalTitle,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage,
      this.firstAirDate,
      this.originCountry,
      this.name,
      this.originalName});

  KnownFor.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country'].cast<String>();
    name = json['name'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['first_air_date'] = firstAirDate;
    data['origin_country'] = originCountry;
    data['name'] = name;
    data['original_name'] = originalName;
    return data;
  }
}