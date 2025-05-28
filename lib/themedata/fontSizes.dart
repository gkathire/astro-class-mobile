// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class normalText extends StatelessWidget{
  String text="";
  Color? color;
  FontWeight? fontweight=FontWeight.w500;
  normalText({super.key, required String text, required Color color, FontWeight? fontweight}){
    this.text=text;
    this.color=color;
    this.fontweight=fontweight;
  }
  @override
  Widget build(BuildContext context){
    return Text(text, style: TextStyle(color: color),textScaleFactor: 1.sp,);
  }
}

class TitleText extends StatelessWidget{
  String text="";
  Color? color;
  FontWeight? fontweight=FontWeight.w500;
  TitleText({super.key, required String text, required Color color, FontWeight? fontweight}){
    this.text=text;
    this.color=color;
    this.fontweight=fontweight;
  }
  @override
  Widget build(BuildContext context){
    return Text(text, style: TextStyle(color: color, fontWeight:fontweight),textScaleFactor: 2.sp,);
  }
}
class MediumText extends StatelessWidget{
  String text="";
  Color? color;
  FontWeight? fontweight=FontWeight.w500;
  TextEditingController? controller=new TextEditingController();
  MediumText({super.key, required String text, required Color color, FontWeight? fontweight, TextEditingController? controller}){
    this.text=text;
    this.color=color;
    this.fontweight=fontweight;
    this.controller=controller;
  }
  @override
  Widget build(BuildContext context){
    return Text(text, style: TextStyle(color: color, fontWeight:fontweight),textScaleFactor: 1.4.sp,);
  }
}
class SmallMediumText extends StatelessWidget{
  String text="";
  Color? color;
  FontWeight? fontweight=FontWeight.w500;
  SmallMediumText({super.key, required String text, required Color color, FontWeight? fontweight}){
    this.text=text;
    this.color=color;
    this.fontweight=fontweight;
  }
  @override
  Widget build(BuildContext context){
    return Text(text, style: TextStyle(color: color, fontWeight:fontweight),textScaleFactor: 1.2.sp,);
  }
}
