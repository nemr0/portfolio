

import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class DrawerIcon extends StatefulWidget {
  const DrawerIcon({super.key});

  @override
  State<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    animation = Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'drawer-icon',
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: animation.isAnimating?null:(){
          // open drawer
          if(animation.value==1){
            controller.forward();
          }
          // close drawer
          if(animation.value==0){
            controller.reverse();
          }
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: animation,
          color: AppColors.textColor,
          size: context.mobile ? 35.h : 55.h,
        ),
      ),
    );
  }
}
