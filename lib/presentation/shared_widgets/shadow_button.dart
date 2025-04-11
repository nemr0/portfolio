import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.color = AppColors.primary, this.padding,  this.width=2.5,  this.animate=0});

  final Widget child;
  final Future<void> Function()? onPressed;
  final Color color;
  final EdgeInsets? padding;
  final double width;
  final int animate;
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
    Future<void> Function()? onPressed,
    Color color = AppColors.primary,
    int animate =0,
    TextStyle? textStyle,
    EdgeInsets? padding,
    double width=2.5,
  }) {
    return ShadowButton(
      key: key,
      onPressed: onPressed,
      color: color,
      padding: padding,
      child: textWidget(text,textStyle: textStyle),
      animate: animate,
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
            onPressed:loading?null:widget.onPressed==null?null: () async {
              if (!loading) {
                await hideShadow();

               await widget.onPressed!();
                showShadow();

              }
            },
            child: AnimatedContainer(
                decoration: shadowDecoration(
                    width: widget.width,
                    hideShadow:widget.onPressed==null?true: loading,
                    hover: hover?true:widget.animate.isEven,
                    borderRadius: BorderRadius.circular(5),
                    color: widget.color),
                duration: pressButtonInterval,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                  child: widget.child,
                ))),
      ),
    );
  }
}
