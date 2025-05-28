import 'package:flutter_app/main.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';

void showGlobalErrorDialog({required String title, required String content}) {
  navigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor:
            Colors.transparent, // Make the scaffold background transparent
        body: Center(
          child: Container(
            color: ThemeColor
                .mainThemeLightColorForDialogBackground, // Set your desired background color here
            child: AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
