import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final BorderRadius borderRadius;
  final List<String>? autoFillHints;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,

    this.validator,  this.minLines=1, this.maxLines=1,  this.keyboardType= TextInputType.text,  this.textInputAction=TextInputAction.next, this.focusNode, this.prefixIcon,  this.borderRadius=const BorderRadius.all(Radius.circular(10)),  this.autoFillHints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.mobile ? 0 : context.width * .3),
      child: TextFormField(
        autofillHints: autoFillHints,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
        showCursor: true,
        style: TextStyle(color: AppColors.scaffoldBackground, fontSize: 14.spMin),
        decoration: InputDecoration(
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
          ),
          isDense: true,
          // constraints: BoxConstraints(minHeight: 20.spMin),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 15.spMin),
          hintText: hint,
          fillColor: AppColors.textColor,
          filled: true,
          hintStyle: TextStyle(
            color: AppColors.scaffoldBackground.withAlpha(160),
            fontSize: 14.spMin,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
