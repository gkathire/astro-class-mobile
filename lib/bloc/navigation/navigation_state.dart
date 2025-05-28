import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NavigationState {
  final List<MovieModel>? movieList;
  final MovieModel? selectedMovie;
  final int selectedIndex;
  const NavigationState(
      {required this.movieList,
      required this.selectedMovie,
      required this.selectedIndex});
}

class NavigationStateSelectedItem extends NavigationState {
  const NavigationStateSelectedItem(
      {super.movieList, super.selectedMovie, required super.selectedIndex});
}
