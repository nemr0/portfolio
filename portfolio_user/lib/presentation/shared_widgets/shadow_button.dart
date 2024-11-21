import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.color = AppColors.primary, this.padding});

  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final EdgeInsets? padding;

  /// Named constructor for creating a button with text
  factory ShadowButton.text({
    Key? key,
    required String text,
    VoidCallback? onPressed,
    Color color = AppColors.primary,
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) {
    return ShadowButton(
      key: key,
      onPressed: onPressed,
      color: color,
      padding: padding,
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.spMin,
            ),
      ),
    );
  }

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool hideShadow = false;
  bool pressed = false;

  hideAndShowShadow() async {
    await Future.delayed(Duration.zero);
    setState(() {
      hideShadow = true;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      hideShadow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding??EdgeInsets.zero,
      child: MouseRegion(
        onEnter: (_) {
          if (!hideShadow && !pressed) {
            setState(() {
              hideShadow = true;
            });
          }
        },
        onExit: (_) {
          if (hideShadow) {
            setState(() {
              hideShadow = false;
            });
          }
        },
        child: GestureDetector(
            onTap: () async {
              if (widget.onPressed != null) {
                if (hideShadow) {
                  setState(() {
                    hideShadow = false;
                    pressed = true;
                  });
                  await Future.delayed(Duration(milliseconds: 200));
                }
                hideAndShowShadow();
                widget.onPressed!();
                pressed = false;
              }
            },
            child: AnimatedContainer(
                decoration: shadowDecoration(
                    hideShadow: hideShadow,
                    borderRadius: BorderRadius.circular(5),
                    color: widget.color),
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  child: widget.child,
                ))),
      ),
    );
  }
}
