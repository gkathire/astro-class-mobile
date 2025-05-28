import 'package:astro_mobile/pages/screens/auth_screens/reset_password/reset_password_page.dart';
import 'package:astro_mobile/pages/widgets/text_field.dart';
import 'package:astro_mobile/theme_data/font_sizes.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeVerificationPage extends StatelessWidget {
  final verificationCodeController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.h,
              ),
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
                width: 20.w,
              ),
              Container(
                  width: 300.w,
                  child: normalText(
                    color: ThemeColor.black,
                    text: "We have sent you an email with a verification!",
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
                  width: 20.w,
                ),
                Container(
                    width: 300.w,
                    child: MediumText(
                        color: ThemeColor.black, text: "Verification Code"))
              ],
            ),
          ]),
          SizedBox(
            height: 10.h,
          ),
          Center(
              child: LoginTextField(
            "EX: 123456",
            hint: "Verification Code",
          )),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: SizedBox(
              height: 60.h,
              width: 390.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordPage()));
                },
                child: Center(
                    child: MediumText(
                  text: "Submit",
                  color: ThemeColor.white,
                  fontweight: FontWeight.w700,
                )),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    backgroundColor: ThemeColor.mainThemeColor),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
