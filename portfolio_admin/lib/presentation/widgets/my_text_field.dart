import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
