import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/get_input_decoration.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final BorderRadius borderRadius;
  final List<String>? autoFillHints;
  final double? overrideBottomPadding;
  const CustomTextField({
    super.key,
    required this.hint,
     this.controller,

    this.validator,  this.minLines=1, this.maxLines=1,  this.keyboardType= TextInputType.text,  this.textInputAction=TextInputAction.next, this.focusNode, this.prefixIcon,  this.borderRadius=const BorderRadius.all(Radius.circular(10)),  this.autoFillHints,  this.overrideBottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.mobile ? 0 : context.width * .3,bottom: overrideBottomPadding??2),
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
        style: context.textTheme.labelMedium,
        decoration: getInputDecoration(context,hintText: hint,borderRadius: borderRadius)
      ),
    );
  }
}
