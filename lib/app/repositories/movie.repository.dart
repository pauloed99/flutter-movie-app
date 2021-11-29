import 'package:dio/dio.dart';
import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/models/movie.top.rated.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository({required this.dio});

  Future<MoviePopulars> getMoviesPopular() async {
    try {
      final response = await dio.get('movie/popular');
      final moviesPopulars = MoviePopulars.fromJson(response.data);
      return moviesPopulars;
    } catch (e) {
      throw Exception('Erro no servidor!');
    }
  }

  Future<MovieTopRated> getMoviesTopRated() async {
    try {
      final response = await dio.get('movie/top_rated');
      final moviesTopRated = MovieTopRated.fromJson(response.data);
      return moviesTopRated;
    } catch (e) {
      throw Exception('Erro no servidor!');
    }
  }
}
