import 'package:flutter/material.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.ASSETS_WEBP_AVATAR_WEBP, height: context.mobile ? 145 : 185,);
  }
}
