import 'dart:typed_data';

import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/app_vectors.dart';
import 'package:astro_mobile/pages/layout/sidebar/sidebar_widget.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/catalogue_card.dart';
import 'package:astro_mobile/pages/widgets/astro_widgets/welcome_container.dart';
import 'package:astro_mobile/screen_utils/extensions/extens.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constant/app_images.dart';

class CataloguePage extends StatefulWidget {
  final LoggedInUserModel? userModel;
  final Uint8List? profileByesData;
  const CataloguePage(
      {super.key, required this.userModel, required this.profileByesData});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  List catalogues = [
    {
      "title": "Intro Plan Subscription",
      "validityMonths": 1,
      "price": 999,
      "color": AppColors.greenColor,
      "iconPath": AppVectors.refresh
    },
    {
      "title": "Next Step Subscription",
      "validityMonths": 3,
      "price": 1999,
      "color": AppColors.blueColor,
      "iconPath": AppVectors.mLogo
    },
    {
      "title": "Grow Pack Subscription",
      "validityMonths": 6,
      "price": 2999,
      "color": AppColors.redCOlor,
      "iconPath": AppVectors.saturnLogo
    },
    {
      "title": "Full Journey Subscription",
      "validityMonths": 12,
      "price": 3999,
      "color": AppColors.pinkColor,
      "iconPath": AppVectors.check
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SidebarWidget(
          profileByesData: widget.profileByesData,
          userModel: widget.userModel,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            child: Column(
              children: [
                1.ph,
                Image.asset(
                  AppImages.sukran,
                  width: 55.w,
                  height: 5.h,
                  fit: BoxFit.contain,
                ),
                1.ph,
                WelcomeContainer(
                  profileByesData: widget.profileByesData,
                  title: "Catalogues",
                  subtitle: "Pick a plan that fits your journey",
                ),
                2.ph,
                ListView.builder(
                    itemCount: catalogues.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: CatalogueCard(
                            title: catalogues[index]['title'],
                            validityMonths: catalogues[index]['validityMonths'],
                            isRecommended: index == 1,
                            price: catalogues[index]['price'],
                            color: catalogues[index]['color'],
                            iconPath: catalogues[index]['iconPath']),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
