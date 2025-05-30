// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hinttext;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final InputBorder? inputBorder;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool? isObscureText;
  final String? errorText;
  final String? prefixText;
  final TextCapitalization? textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final BorderSide? borderSide;
  final double? borderRadius;
  final double? fontSize;
  final Color? fillColor;
  final bool? autofocus;
  final FocusNode? focusNode;
  const CustomTextField({
    super.key,
    this.controller,
    this.validator,
    this.hinttext,
    this.hintStyle,
    this.style,
    this.inputBorder,
    this.focusedBorder,
    this.inputFormatters,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.onChanged,
    this.keyboardType,
    this.suffixIcon,
    this.onTap,
    this.readOnly,
    this.isObscureText,
    this.errorText,
    this.textCapitalization,
    this.prefixIcon,
    this.prefixText,
    this.contentPadding,
    this.borderSide,
    this.borderRadius,
    this.fontSize,
    this.fillColor,
    this.autofocus,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
          controller: controller,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          validator: validator,
          obscureText: isObscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          autofocus: autofocus ?? false,
          style: style ??
              TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize ?? 18.sp,
                  color: Colors.black),
          minLines: minLines,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          readOnly: readOnly ?? false,
          textInputAction: textInputAction,
          focusNode: focusNode,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 6.w, right: 3.w),
              child: prefixIcon,
            ),
            prefixText: prefixText,
            prefixIconConstraints: BoxConstraints(maxHeight: 60),
            suffixIconConstraints: BoxConstraints(maxWidth: 30.w),
            contentPadding: contentPadding,
            counterText: "",
            hintText: hinttext,
            errorText: errorText,
            hintStyle: hintStyle ??
                TextStyle(
                    fontSize: fontSize ?? 18, color: ThemeColor.lightGrey),
            border: inputBorder ?? buildOutlineInputBorder(borderSide),
            enabledBorder: inputBorder ?? buildOutlineInputBorder(borderSide),
            errorBorder: inputBorder ?? buildOutlineInputBorder(borderSide),
            disabledBorder: buildOutlineInputBorder(borderSide),
            focusedBorder:
                focusedBorder ?? buildFocusOutlineInputBorder(borderSide),
            focusedErrorBorder:
                focusedBorder ?? buildFocusOutlineInputBorder(borderSide),
          )),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BorderSide? borderSide) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: borderSide ?? BorderSide.none);
  }

  OutlineInputBorder buildFocusOutlineInputBorder(BorderSide? borderSide) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(color: AppColors.blueColor));
  }
}
