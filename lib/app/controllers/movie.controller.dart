import 'package:movies_app/app/models/movie.dart';
import 'package:movies_app/app/models/movie.images.dart';
import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/models/movie.top.rated.dart';
import 'package:movies_app/app/models/movie.videos.dart';
import 'package:movies_app/app/repositories/movie.repository.dart';

class MovieController {
  final MovieRepository movieRepository;

  MovieController({required this.movieRepository});

  Future<MoviePopulars> getMoviePopulars() async {
    final moviesPopulars = await movieRepository.getMoviesPopular();
    return moviesPopulars;
  }

  Future<MovieTopRated> getMoviesTopRated() async {
    final moviesTopRated = await movieRepository.getMoviesTopRated();
    return moviesTopRated;
  }

  Future<Movie> getSpecificMovie(String id) async {
    final movie = await movieRepository.getSpecificMovie(id);
    return movie;
  }

  Future<MovieVideos> getMovieVideos(String id) async {
    final movieVideos = await movieRepository.getMovieVideos(id);
    return movieVideos;
  }

  Future<MovieImages> getMovieImages(String id) async {
    final movieImages = await movieRepository.getMovieImages(id);
    return movieImages;
  }
}
