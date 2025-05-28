import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/pages/widgets/text_field.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/font_sizes.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: ContentStyle.contentSmallPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  TitleText(
                      text: "Forgot Password?",
                      color: ThemeColor.mainThemeColor,
                      fontweight: FontWeight.bold)
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 300.w,
                      child: normalText(
                        color: ThemeColor.black,
                        text:
                            "Enter your email and instructions will be sent to you!",
                      ))
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Row(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 300.w,
                      child: MediumText(
                        color: ThemeColor.black,
                        text: "Email",
                      ),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 10.h,
              ),
              Center(
                  child: LoginTextField(
                "Enter email",
                hint: "Enter you email",
              )),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  height: 45.h,
                  width: ScreenSizeUtils.getScreenWidth(context),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: ThemeColor.mainThemeColor),
                    child: Center(
                        child: MediumText(
                      color: ThemeColor.white,
                      text: "Submit",
                    )),
                  ),
                ),
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              )
            ],
          ),
        ));
  }
}
