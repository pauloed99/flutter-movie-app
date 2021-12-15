import 'package:dio/dio.dart';
import 'package:movies_app/app/models/movie.dart';
import 'package:movies_app/app/models/movie.images.dart';
import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/models/movie.top.rated.dart';
import 'package:movies_app/app/models/movie.videos.dart';
import 'package:movies_app/app/models/movies.search.dart';

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

  Future<Movie> getSpecificMovie(String id) async {
    try {
      final response = await dio.get('movie/$id');
      final movie = Movie.fromJson(response.data);
      return movie;
    } catch (e) {
      throw Exception('Erro no servidor!');
    }
  }

  Future<MovieVideos> getMovieVideos(String id) async {
    try {
      final response = await dio.get('movie/$id/videos');
      final movieVideos = MovieVideos.fromJson(response.data);
      return movieVideos;
    } catch (e) {
      throw Exception('Erro no servidor!');
    }
  }

  Future<MovieImages> getMovieImages(String id) async {
    try {
      final response = await dio.get('movie/$id/images');
      final movieImages = MovieImages.fromJson(response.data);
      return movieImages;
    } catch (e) {
      throw Exception('Erro no servidor!');
    }
  }

  Future<MoviesSearch> searchSpecificMovies(String movie) async {
    try {
      final response =
          await dio.get('search/movie', queryParameters: {'query': movie});
      final specificMovies = MoviesSearch.fromJson(response.data);
      return specificMovies;
    } on DioError catch (e) {
      throw Exception('Erro no servidor');
    }
  }
}
