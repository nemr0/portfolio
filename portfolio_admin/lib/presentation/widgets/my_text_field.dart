import 'package:flutter/material.dart';
import 'package:portfolio_shared/validators/validate_email.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
     this.controller,
    this.textInputAction,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1, this.prefix, this.onChanged, this.validator = notEmptyValidator,
  });

  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String hintText;
  final Widget? prefix;
  final int minLines;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 0,minHeight: 0)
      ),
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
