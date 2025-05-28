import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class NavigationEvent {
  final List<MovieModel>? movieList;
  final MovieModel? selectedMovie;
  final int selectedIndex;
  const NavigationEvent(
      {required this.movieList,
      required this.selectedMovie,
      required this.selectedIndex});
}

class NavigationEventSelectedItem extends NavigationEvent {
  const NavigationEventSelectedItem(
      {required super.movieList,
      required super.selectedMovie,
      required super.selectedIndex});
}

class NavigationEventReset extends NavigationEvent {
  const NavigationEventReset(
      {super.movieList, super.selectedMovie, required super.selectedIndex});
}
