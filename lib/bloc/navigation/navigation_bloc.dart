import 'package:astro_mobile/bloc/navigation/navigation_event.dart';
import 'package:astro_mobile/bloc/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(const NavigationStateSelectedItem(
          selectedIndex: 0,
        )) {
    on<NavigationEventSelectedItem>((event, state) {
      final selectedIndex = event.selectedIndex;
      return emit(NavigationStateSelectedItem(selectedIndex: selectedIndex));
    });

    on<NavigationEventReset>((event, state) {
      emit(const NavigationStateSelectedItem(
        selectedIndex: 0,
      ));
    });
  }
}
