import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/catalogue_page/catalogue_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/class_list_page/class_list_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/message_page/messages_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/profile/profile_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/screens/welcome_page/welcome_page.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const CustomBottomNav(
      {super.key, required this.userModel, required this.profileByesData});
  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      AppVectors.home,
      AppVectors.svgClass,
      AppVectors.path,
      AppVectors.chat,
      AppVectors.person,
    ];

    final List<Widget> pages = [
      WelcomePage(
          userModel: widget.userModel, profileByesData: widget.profileByesData),
      ClassListPage(
          userModel: widget.userModel, profileByesData: widget.profileByesData),
      CataloguePage(
          userModel: widget.userModel, profileByesData: widget.profileByesData),
      MessagesPage(
          userModel: widget.userModel, profileByesData: widget.profileByesData),
      ProfilePage(
          userModel: widget.userModel, profileByesData: widget.profileByesData),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final itemWidth = totalWidth / icons.length;

            return Stack(
              children: [
                // Sliding circle background
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: itemWidth * _currentIndex +
                      (itemWidth / 2) -
                      22, // Center the circle
                  top: 10,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Icons
                Row(
                  children: List.generate(icons.length, (index) {
                    final isSelected = _currentIndex == index;
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: SizedBox(
                        width: itemWidth,
                        height: 60,
                        child: Center(
                          child: SvgPicture.asset(
                            icons[index],
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
