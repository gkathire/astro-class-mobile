import 'package:astro_mobile/main.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
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
