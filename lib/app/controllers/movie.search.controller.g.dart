// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.search.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieSearchController on _MovieSearchControllerBase, Store {
  final _$moviesSearchAtom =
      Atom(name: '_MovieSearchControllerBase.moviesSearch');

  @override
  ObservableFuture<MoviesSearch>? get moviesSearch {
    _$moviesSearchAtom.reportRead();
    return super.moviesSearch;
  }

  @override
  set moviesSearch(ObservableFuture<MoviesSearch>? value) {
    _$moviesSearchAtom.reportWrite(value, super.moviesSearch, () {
      super.moviesSearch = value;
    });
  }

  @override
  String toString() {
    return '''
moviesSearch: ${moviesSearch}
    ''';
  }
}
