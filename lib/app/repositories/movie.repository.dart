import 'package:dio/dio.dart';
import 'package:movies_app/app/models/movie.populars.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository({required this.dio});

  Future<MoviePopulars> getMoviesPopular() async {
    final response = await dio.get('movie/popular');
    final moviesPopulars = MoviePopulars.fromJson(response.data);
    return moviesPopulars;
  }
}
