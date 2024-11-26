import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';

class FontSettings{
  static  TextTheme textTheme (BuildContext context)=>TextTheme(
    bodyLarge: TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.textColor,

    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: AppColors.textColor,
    ),
  );
}