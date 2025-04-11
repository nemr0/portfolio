import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show InputDecoration, OutlineInputBorder;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

getInputDecoration(BuildContext context,{BorderRadius? borderRadius,required String hintText, IconData? prefixIcon}) {
  borderRadius ??= BorderRadius.zero;
  return InputDecoration(
    prefixIcon:  prefixIcon==null?null:Icon(
      prefixIcon,
      color: AppColors.scaffoldBackground,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    constraints: BoxConstraints(
        maxWidth: 284.sp,
        maxHeight: 50.sp
    ),
    isDense: true,
    // constraints: BoxConstraints(minHeight: 20.spMin),
    // contentPadding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 15.spMin),
    hintText: hintText,
    fillColor: AppColors.textColor,
    filled: true,
    hintStyle: context.textTheme.labelMedium?.copyWith(color: AppColors.scaffoldBackground.withAlpha(120)),
    border: OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
    ),
  );
}