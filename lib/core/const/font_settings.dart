import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/const/colors.dart';

class FontSettings {
  static String fontFamily = GoogleFonts.workSans().fontFamily??'';
  static TextTheme textTheme(BuildContext context) => GoogleFonts.workSansTextTheme(
       TextTheme( bodyLarge: TextStyle(
         fontSize: 40.sp,
         fontWeight: FontWeight.w900,
         color: AppColors.textColor,
       ),
         bodyMedium: TextStyle(
             fontSize: 24.sp,
             fontWeight: FontWeight.w600,
             color: AppColors.textColor),
         bodySmall: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 16.sp,
           color: AppColors.textColor,
         ),

         labelLarge: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 16.sp,
           color: AppColors.scaffoldBackground,
         ),
         labelMedium: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 14.sp,
           color: AppColors.scaffoldBackground,
         ),
         labelSmall: TextStyle(
           fontWeight: FontWeight.w100,
           fontSize: 12.sp,
           color: AppColors.scaffoldBackground,
         ),)
      );
}
