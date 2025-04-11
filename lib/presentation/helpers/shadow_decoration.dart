import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';

Decoration shadowDecoration(
    {Color color = AppColors.primary,
      Color shadowColor =AppColors.textColor,
    double borderWidth = 3,
    required BorderRadius borderRadius,
    bool hideShadow=false,
      bool bigWidth=false,
      /// left = false , right = true
      bool rightBottomOrLeftTopShadow=false,
    }) {
  return ShapeDecoration(
    color: color,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width:  bigWidth?borderWidth*1.5: borderWidth - (borderWidth / 3),
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
        offset:rightBottomOrLeftTopShadow?Offset(-borderWidth, -borderWidth): Offset(borderWidth, borderWidth),
        spreadRadius: borderWidth,
      )
    ],
  );
}
