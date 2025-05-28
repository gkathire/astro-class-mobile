import 'package:equatable/equatable.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MovieState {
  final bool isLoading;
  final String? loadingText;
  const MovieState({required this.isLoading, this.loadingText});
}

class MovieStateNotInitialized extends MovieState {
  final Exception? exception;
  const MovieStateNotInitialized(
      {required super.isLoading, required this.exception});
}

class MovieStateInitialized extends MovieState with EquatableMixin {
  final List<MovieModel>? movieListModel;
  const MovieStateInitialized(
      {required super.isLoading, required this.movieListModel});
  @override
  List<Object?> get props => [isLoading, movieListModel];
}

class MovieStateMovieSelected extends MovieState with EquatableMixin {
  final MovieModel? movieModel;
  final LoggedInUserModel? userModel;
  final List<MovieModel>? movieListModel;
  const MovieStateMovieSelected({
    required super.isLoading,
    required this.movieModel,
    required this.userModel,
    required this.movieListModel,
  });

  @override
  List<Object?> get props => [isLoading, movieModel, userModel, movieListModel];
}
