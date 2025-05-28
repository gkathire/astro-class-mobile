import 'package:flutter_app/bloc/navigation/navigation_event.dart';
import 'package:flutter_app/bloc/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(const NavigationStateSelectedItem(
            selectedIndex: 0, movieList: [], selectedMovie: null)) {
    on<NavigationEventSelectedItem>((event, state) {
      final movieList = event.movieList;
      final selectedMovie = event.selectedMovie;
      final selectedIndex = event.selectedIndex;
      return emit(NavigationStateSelectedItem(
          movieList: movieList,
          selectedMovie: selectedMovie,
          selectedIndex: selectedIndex));
    });

    on<NavigationEventReset>((event, state) {
      emit(const NavigationStateSelectedItem(
          selectedIndex: 0, movieList: [], selectedMovie: null));
    });
  }
}
