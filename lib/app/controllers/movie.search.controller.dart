import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_app/app/models/movies.search.dart';
import 'package:movies_app/app/repositories/movie.repository.dart';
part 'movie.search.controller.g.dart';

class MovieSearchController = _MovieSearchControllerBase
    with _$MovieSearchController;

abstract class _MovieSearchControllerBase with Store {
  final MovieRepository movieRepository;

  _MovieSearchControllerBase(this.movieRepository);

  final inputController = TextEditingController();

  @observable
  ObservableFuture<MoviesSearch>? moviesSearch;

  Future<void> searchSpecificMovies() async {
    moviesSearch = ObservableFuture(
      movieRepository.searchSpecificMovies(inputController.text),
    );
  }
}
