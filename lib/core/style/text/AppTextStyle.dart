import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class AppTextStyle {
  static String fontFamily = 'Meddon';



  static TextStyle headLine() => TextStyle(
    fontSize: 23.0.sp,
    fontWeight: FontWeight.w800,

    fontFamily: fontFamily,
  );

  static TextStyle appBarText() => TextStyle(
    color: Colors.white,
    fontSize: 20.0.sp,
    fontWeight: FontWeight.bold,
    fontFamily: fontFamily,
  );

  static TextStyle bodyText() => TextStyle(
    fontSize: 16.0.sp,

    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: fontFamily,

  );
  static TextStyle subTitle() => TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w800,

    height: 1.3.h,
    fontFamily: fontFamily,
  );
  static TextStyle caption() => TextStyle(
      fontSize: 13.0.sp,
      color: Colors.grey,
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal
  );
}