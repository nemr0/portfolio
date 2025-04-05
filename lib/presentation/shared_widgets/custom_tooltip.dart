import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';

class CustomTooltip extends StatelessWidget {
  const CustomTooltip({super.key, this.message, required this.child,  this.color= AppColors. primary,});
  final String? message;
  final Widget child;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    if(message == null) return child;
    return Tooltip(
      message: message,
      textStyle: TextStyle(fontSize: 12.spMin,color: AppColors.textColor,fontWeight: FontWeight.w200),
      decoration: BoxDecoration(color: color,borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))),
      child: child,
    );
  }
}
