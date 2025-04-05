import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/generated/assets.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.webpAvatar, height: context.mobile ? 145 : 185,);
  }
}
