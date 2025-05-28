import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginTextField extends StatefulWidget {
  bool isPassword;
  String? label;
  final String? hint;
  TextEditingController? controller;
  LoginTextField(String? label,
      {super.key,
      this.controller,
      this.isPassword = false,
      required this.hint});
  @override
  State<LoginTextField> createState() => _TextfieldState(isPassword);
}

class PasswordTextField extends LoginTextField {
  PasswordTextField(
      {required String? label,
      TextEditingController? controller,
      String? hint,
      super.key})
      : super(label, controller: controller, isPassword: true, hint: hint);
}

class _TextfieldState extends State<LoginTextField> {
  _TextfieldState(this.isPassword);
  bool isPassword;
  bool _isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenSizeUtils.getScreenWidth(context),
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: ThemeColor.lightGrey),
        ),
        child: Row(
          children: [
            const SizedBox(),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(),
            SizedBox(
              width: widget.isPassword ? 250.w : 310.w,
              child: TextField(
                  controller: widget.controller,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                        fontStyle: widget.label == "EX: 123456"
                            ? FontStyle.italic
                            : null,
                        height: 2,
                        letterSpacing: 0.01,
                        fontSize: 15.sp,
                        color: const Color(0xffC8C8C8)),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  obscureText: isPassword),
            ),
          ],
        ));
  }
}
