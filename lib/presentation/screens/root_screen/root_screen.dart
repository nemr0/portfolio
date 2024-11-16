import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/widgets/header_sliver.dart';
import 'package:portfolio/presentation/widgets/pattern_background.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with SingleTickerProviderStateMixin {
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
        height: 100.spMin,
      ),
      Image.asset(
        AppAssets.ASSETS_WEBP_AVATAR_WEBP,
        // height: context.mobile ? 96.spMin : 132.spMin,
      ),
      SizedBox(
        height: 10.spMin,
      ),
      RichText(
        maxLines: 4,
        overflow: TextOverflow.visible,
        text: TextSpan(
            text: 'Hi, my name is',
            style: Theme.of(context).textTheme.bodySmall,
            children: [
              TextSpan(
                text: ' Omar Elnemr,\n',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              TextSpan(text: 'I DEVELOP\nMOBILE\nAPPLICATIONS,',style: Theme.of(context).textTheme.bodyLarge,),
            ]),
      )
    ];
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
              body: Padding(
            padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w,bottom: 10),
            child: CupertinoScrollbar(
              child: CustomScrollView(
                slivers: [
                  const HeaderSliver(),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Align(
                          alignment: Alignment.centerLeft, child: body[index]),
                      childCount: body.length,
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
