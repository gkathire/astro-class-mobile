import 'package:flutter/foundation.dart';

@immutable
abstract class NavigationState {
  final int selectedIndex;
  const NavigationState({required this.selectedIndex});
}

class NavigationStateSelectedItem extends NavigationState {
  const NavigationStateSelectedItem({required super.selectedIndex});
}
