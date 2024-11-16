import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class FontSettings{
  static const String kFontWorkSans='WorkSans';
  static  TextTheme textTheme (BuildContext context)=>TextTheme(
    bodyLarge: TextStyle(
      fontSize: 40.spMax,
      fontWeight: FontWeight.w900,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16.spMax,
    ),
  );
}