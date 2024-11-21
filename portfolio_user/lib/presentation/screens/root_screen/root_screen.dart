import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/avatar.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/appbar/header_sliver.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/hire_me_button.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/intro_text.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/pattern_background.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/projects_view.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/presentation/shared_widgets/scaler.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      SizedBox(
        height: 40.spMin,
      ),
      const ScaleEffect(child: Avatar()),
      SizedBox(
        height: 40.spMin,
      ),
      const ScaleEffect(child:  IntroText()),
      SizedBox(
        height: 40.spMin,
      ),
     const HireMeButton(),
      SizedBox(
        height: 40.spMin,
      ),
      const ProjectsView(),
    ];

    final EdgeInsets padding =
        EdgeInsets.only(right: 20.w, left: 20.w, bottom: 10);

    return PatternBackground(
        child: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      child: Container(
        decoration: shadowDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Scaffold(
              body: CupertinoScrollbar(
            controller: controller,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  SliverPadding(
                      padding: padding.copyWith(top: 10.h),
                      sliver: HeaderSliver(
                        onTap: () {
                          controller.animateTo(0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut);
                        },
                      )),
                  SliverPadding(
                    padding: padding,
                    sliver: LiveSliverList(
                      itemCount: body.length,
                      controller: controller,
                      reAnimateOnVisibility: true,
                      showItemDuration: showItemDuration,
                      showItemInterval: showItemInterval,
                      itemBuilder: (BuildContext context, int index, Animation<double> animation)
                      {
                        if(body[index] is SizedBox) return body[index];
                          return ItemAnimationBuilder(
                            animation: animation,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: body[index]),
                          );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    )));
  }
}
