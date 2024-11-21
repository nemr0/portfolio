import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSettings{
  static  TextTheme textTheme (BuildContext context)=>TextTheme(
    bodyLarge: TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w900,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
  );
}