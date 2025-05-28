import 'package:flutter/material.dart';

InputDecoration appTextDefaultDecoration({required String hintText}) {
  return InputDecoration(
    fillColor: Colors.white70,
    filled: true,
    hintText: hintText,
    hintStyle: const TextStyle(color: Color(0xFFC6C8CA)),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26),
    ),
  );
}
