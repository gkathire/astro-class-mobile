import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MovieEvent {
  const MovieEvent();
}

class MovieEventInitialized extends MovieEvent {
  const MovieEventInitialized();
}

class MovieEventMovieSelected extends MovieEvent {
  final MovieModel? movieModel;
  final bool? refreshMovieList;
  final LoggedInUserModel? userModel;
  final List<MovieModel>? movieListModel;
  const MovieEventMovieSelected(
      {required this.movieModel,
      required this.userModel,
      this.refreshMovieList,
      required this.movieListModel});
}

class MovieResetEvent extends MovieEvent {
  const MovieResetEvent();
}
