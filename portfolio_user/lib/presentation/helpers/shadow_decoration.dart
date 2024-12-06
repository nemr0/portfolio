import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';

Decoration shadowDecoration(
    {Color color = AppColors.primary,
      Color shadowColor =AppColors.textColor,
    double width = 3,
    required BorderRadius borderRadius,
    bool hideShadow=false,
    }) {
  return ShapeDecoration(
    color: color,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: width-(width/3),
        color: shadowColor,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: borderRadius,
    ),
    shadows: [
      if(!hideShadow)
      BoxShadow(
        color: shadowColor,
        blurRadius: 0,
        offset: Offset(width, width),
        spreadRadius: width,
      )
    ],
  );
}
