import 'package:flutter/material.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';

class ShadowButton extends StatefulWidget {
  const ShadowButton(
      {super.key,
      required this.child,
      this.onPressed,
      this.color = AppColors.primary});

  final Widget child;
  final VoidCallback? onPressed;
  final Color color;

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  bool hideShadow = false;
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
    return MouseRegion(
      onEnter: (_){
        if(!hideShadow) {
          setState(() {
          hideShadow = true;
        });
        }
      },
      onExit: (_){
        if(hideShadow) {
          setState(() {
            hideShadow = false;
          });
        }
      },
      child: GestureDetector(
          onTap: (){
            if(widget.onPressed!= null){
              if(hideShadow){
                setState(() {
                  hideShadow = false;
                });
              }
              hideAndShowShadow();
              widget.onPressed!();
            }
          },
          child: AnimatedContainer(
              decoration: shadowDecoration(
                hideShadow: hideShadow,
                  borderRadius: BorderRadius.circular(5), color: widget.color),
              duration: const Duration(milliseconds: 300),
              child: widget.child)),
    );
  }
}
