import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';

class ChatInformationPage extends StatefulWidget {
  final LoggedInUserModel? userModel;
  ChatInformationPage({
    super.key,
    required this.userModel,
  });

  @override
  State<ChatInformationPage> createState() => _ChatInformationPageState();
}

class _ChatInformationPageState extends State<ChatInformationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: ThemeColor.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Container(child: Text("Chat"))],
      ),
    ));
  }
}
