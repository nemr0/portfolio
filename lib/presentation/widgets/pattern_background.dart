import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';

class PatternBackground extends StatelessWidget {
  const PatternBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(
              repeat: ImageRepeat.repeat,
              scale: 4,
              opacity: .75,
              image: AssetImage(AppAssets.ASSETS_WEBP_BACKGROUND_PATTERN_WEBP,))),
      child: child,

    );
  }
}