import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const ComingSoonPage(
      {super.key, required this.userModel, required this.profileByesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coming Soon ")),
      body: const Center(child: Text("🔖 Coming Soon ")),
    );
  }
}
