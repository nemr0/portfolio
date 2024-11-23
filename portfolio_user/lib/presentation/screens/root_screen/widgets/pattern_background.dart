import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';

class PatternBackground extends StatelessWidget {
  const PatternBackground({super.key, required this.child, this.overrideBackgroundColor});
  final Widget child;
  final Color? overrideBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration:  BoxDecoration(
          color: overrideBackgroundColor??AppColors.background,
          image: DecorationImage(
              repeat: ImageRepeat.repeat,
              scale: 4,
              opacity: .75,
              image: AssetImage(AppAssets.ASSETS_WEBP_BACKGROUND_PATTERN_WEBP,))),
      duration: Duration(milliseconds: 300),
      child: child,

    );
  }
}