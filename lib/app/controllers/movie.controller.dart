import 'package:movies_app/app/models/movie.populars.dart';
import 'package:movies_app/app/repositories/movie.repository.dart';

class MovieController {
  final MovieRepository movieRepository;

  MovieController({required this.movieRepository});

  Future<MoviePopulars> getMoviePopulars() async {
    final moviesPopulars = await movieRepository.getMoviesPopular();
    return moviesPopulars;
  }
}
