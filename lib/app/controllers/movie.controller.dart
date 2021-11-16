import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/models/movie.top.rated.dart';
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
}
