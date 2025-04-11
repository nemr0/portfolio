import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = AppColors.primary,
    this.padding,
    this.borderWidth = 2.5,
    this.animate = false,
  });

  final Widget child;
  final Future<void> Function()? onPressed;
  final Color color;
  final EdgeInsets? padding;
  final double borderWidth;
  final bool animate;

  static Text textWidget(String text, {TextStyle? textStyle}) => Text(
    text,
    style:
        textStyle ??
        TextStyle(
          fontWeight: FontWeight.w900,
          color: AppColors.textColor,
          fontSize: 20.spMin,
        ),
  );

  /// Named constructor for creating a button with text
  factory ShadowButton.text({
    Key? key,
    required String text,
    Future<void> Function()? onPressed,
    Color color = AppColors.primary,
    bool animate = false,
    TextStyle? textStyle,
    EdgeInsets? padding,
    double width = 2.5,
  }) {
    return ShadowButton(
      key: key,
      onPressed: onPressed,
      color: color,
      padding: padding,
      animate: animate,
      child: textWidget(text, textStyle: textStyle),
    );
  }

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool loading = false;
  bool hover = false;

  hideShadow() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(pressButtonInterval);
  }

  showShadow() async {
    setState(() {
      loading = false;
    });
  }

  late int animate;
  late Timer animateTime;

  timerCallback(_) {
    if (animate < 100) {
      setState(() {
        animate++;
      });
      return;
    }
    animate = 0;
  }

  @override
  void initState() {
    animate = 0;
    if (widget.animate) {
      animateTime = Timer.periodic(Duration(seconds: 1), timerCallback);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShadowButton oldWidget) {
    if (oldWidget.animate == false && widget.animate) {
      animate = 0;
      animateTime = Timer.periodic(Duration(seconds: 1), timerCallback);
    }
    if (oldWidget.animate == true && widget.animate == false) {
      animateTime.cancel();
      setState(() {
        animate = 0;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    if (widget.animate) {
      animateTime.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hover = true;
        });
      },
      onExit: (_) {
        setState(() {
          hover = false;
        });
      },
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: CupertinoButton(
          pressedOpacity: .9,
          padding: EdgeInsets.zero,
          onPressed:
              loading ? null : widget.onPressed == null ? null : () async {
                    if (!loading) {
                      if (widget.animate) {
                        animateTime.cancel();
                        setState(() {
                          animate = 0;
                        });
                      }
                      await hideShadow();

                      await widget.onPressed!();
                      showShadow();
                      if (widget.animate) {
                        animateTime = Timer.periodic(
                          Duration(seconds: 1),
                          timerCallback,
                        );
                      }
                    }
                  },
          child: AnimatedContainer(
            decoration: shadowDecoration(
              borderWidth: widget.borderWidth,
              hideShadow: widget.onPressed == null ? true : loading ,
              bigWidth: widget.animate ? hover : false,
              rightBottomOrLeftTopShadow: hover ? true : animate.isOdd,
              borderRadius: BorderRadius.circular(5),
              color: widget.color,
            ),
            duration: pressButtonInterval,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0.spMin,
                horizontal: 6.0.spMin,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
