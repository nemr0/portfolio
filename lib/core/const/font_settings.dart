import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/const/colors.dart';

class FontSettings {
  static String fontFamily = GoogleFonts.workSans().fontFamily??'';
  static TextTheme textTheme(BuildContext context) => GoogleFonts.workSansTextTheme(
       TextTheme( bodyLarge: TextStyle(
         fontSize: 40.spMin,
         fontWeight: FontWeight.w900,
         color: AppColors.textColor,
       ),
         bodyMedium: TextStyle(
             fontSize: 24.spMin,
             fontWeight: FontWeight.w600,
             color: AppColors.textColor),
         bodySmall: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 16.spMin,
           color: AppColors.textColor,
         ),

         labelLarge: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 16.spMin,
           color: AppColors.scaffoldBackground,
         ),
         labelMedium: TextStyle(
           fontWeight: FontWeight.w500,
           fontSize: 14.spMin,
           color: AppColors.scaffoldBackground,
         ),
         labelSmall: TextStyle(
           fontWeight: FontWeight.w300,
           fontSize: 12.spMin,
           color: AppColors.scaffoldBackground,
         ),
         displayMedium: TextStyle(
           fontWeight: FontWeight.w400,
           fontSize: 14.spMin,
           color: AppColors.textColor,
         ),
         displaySmall: TextStyle(
           fontWeight: FontWeight.w300,
           fontSize: 10.spMin,
           color: AppColors.textColor,
         ),
       )
      );
}
