import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';

Decoration shadowDecoration(
    {Color color = AppColors.primary,
    double width = 3,
    required BorderRadius borderRadius,
    bool hideShadow=false,
    }) {
  return ShapeDecoration(
    color: color,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: width-(width/3),
        color: AppColors.textColor,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: borderRadius,
    ),
    shadows: [
      if(!hideShadow)
      BoxShadow(
        color: AppColors.textColor,
        blurRadius: 0,
        offset: Offset(width, width),
        spreadRadius: width,
      )
    ],
  );
}
