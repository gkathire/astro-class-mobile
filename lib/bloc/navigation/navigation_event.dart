import 'package:flutter/foundation.dart';

@immutable
abstract class NavigationEvent {
  final int selectedIndex;
  const NavigationEvent({required this.selectedIndex});
}

class NavigationEventSelectedItem extends NavigationEvent {
  const NavigationEventSelectedItem({required super.selectedIndex});
}

class NavigationEventReset extends NavigationEvent {
  const NavigationEventReset({required super.selectedIndex});
}
