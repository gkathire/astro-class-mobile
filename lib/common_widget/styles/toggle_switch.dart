import 'package:flutter/material.dart';

typedef ChangeSwitch = void Function(bool value);

class ToggleSwitchWidget extends StatefulWidget {
  ChangeSwitch cnChangeSwitchValue;
  ToggleSwitchWidget({super.key, required this.cnChangeSwitchValue});
  @override
  State<ToggleSwitchWidget> createState() => _ToggleSwitchWidgetState();
}

class _ToggleSwitchWidgetState extends State<ToggleSwitchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      splashRadius: 2,
      value: isSwitched,
      onChanged: (value) {
        widget.cnChangeSwitchValue(value);
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.red[100],
      activeColor: Colors.red[400],
    );
  }
}
