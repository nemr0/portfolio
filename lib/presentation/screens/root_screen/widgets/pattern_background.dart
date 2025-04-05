import 'package:flutter/widgets.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/generated/assets.dart';

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
              scale: 3,
              opacity: .75,
              image: AssetImage(Assets.webpBackgroundPattern,))),
      duration: Duration(milliseconds: 300),
      child: child,

    );
  }
}