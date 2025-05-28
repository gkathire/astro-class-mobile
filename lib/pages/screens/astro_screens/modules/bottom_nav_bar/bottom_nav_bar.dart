import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/screens/astro_screens/modules/catalogue/catalogue_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/modules/class_list/class_list.dart';
import 'package:astro_mobile/pages/screens/astro_screens/modules/coming_soon_page/coming_soon_page.dart';
import 'package:astro_mobile/pages/screens/astro_screens/modules/homepage/homepage.dart';
import 'package:astro_mobile/pages/screens/astro_screens/modules/messages/messages_page.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const ClassList(),
    CataloguePage(),
    MessagesPage(),
    const ComingSoonPage(),
  ];

  final List<String> _icons = [
    AppVectors.home,
    AppVectors.svgClass,
    AppVectors.path,
    AppVectors.chat,
    AppVectors.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final itemWidth = totalWidth / _icons.length;

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_icons.length, (index) {
                    final isSelected = _currentIndex == index;
                    return GestureDetector(
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
                            _icons[index],
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
