import 'package:astro_mobile/pages/screens/auth_screens/login/login_page.dart';
import 'package:astro_mobile/pages/widgets/text_field.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatelessWidget {
  final newPasswordController = TextEditingController();

  ResetPasswordPage({super.key});
  @override
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
              Text(
                "Forgot Password?",
                textScaleFactor: 2.sp,
                style: TextStyle(
                    color: ThemeColor.mainThemeColor,
                    fontWeight: FontWeight.bold),
              )
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
              SizedBox(
                width: 300.w,
                child: Text(
                  "Set your new password to login to your new account!",
                  textScaleFactor: 1.sp,
                ),
              )
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
                SizedBox(
                  width: 300.w,
                  child: Text(
                    "Enter New Password",
                    textScaleFactor: 1.4.sp,
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
            "Password",
            hint: "Enter you Password",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    backgroundColor: ThemeColor.mainThemeColor),
                child: Center(
                  child: Text(
                    "Submit",
                    textScaler: CustomTextScaler.headerTwo,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
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
    );
  }
}
