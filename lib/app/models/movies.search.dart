class MoviesSearch {
  late int page;
  late List<Results> results;
  late int totalResults;
  late int totalPages;

  MoviesSearch.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }
}

class Results {
  String? posterPath;
  late bool adult;
  late String overview;
  late String releaseDate;
  late List<int> genreIds;
  late int id;
  late String originalTitle;
  late String originalLanguage;
  late String title;
  String? backdropPath;
  late num popularity;
  late int voteCount;
  late bool video;
  late num voteAverage;

  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }
}