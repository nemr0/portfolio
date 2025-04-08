import 'package:flutter/cupertino.dart';
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
  static Text  textWidget(String text,{TextStyle? textStyle}) => Text(
    text,
    style: textStyle ??
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
      child: textWidget(text,textStyle: textStyle),
    );
  }

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool hideShadow = false;
  bool hover = false;
  hideAndShowShadow() async {
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
    return MouseRegion(
      onEnter: (_){
        setState(() {
          hover = true;
        });
      },
      onExit: (_){
        setState(() {
          hover = false;
        });
      },
      child: Padding(
        padding: widget.padding??EdgeInsets.zero,
        child: CupertinoButton(
            pressedOpacity: .9,
            padding: EdgeInsets.zero,
            onPressed:widget.onPressed==null?null: () async {
              if (widget.onPressed != null) {


                hideAndShowShadow();
                widget.onPressed!();
              }
            },
            child: AnimatedContainer(
                decoration: shadowDecoration(

                    hideShadow:widget.onPressed==null?true: hideShadow,
                    hover: hover,
                    borderRadius: BorderRadius.circular(5),
                    color: widget.color),
                duration: const Duration(milliseconds: 100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  child: widget.child,
                ))),
      ),
    );
  }
}
