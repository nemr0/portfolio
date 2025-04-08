import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/core/globals/global_elements.dart'
    show gBorderRadius, gPadding;
import 'package:portfolio/generated/assets.dart';
import 'package:portfolio/presentation/routes/router.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/contact_me/contact_me_body.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/links.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/avatar.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/appbar/header_sliver.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/hire_me_button.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/introduction/intro_text.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/pattern_background.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/projects_view.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/section_title.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/data/models/project/project.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key, required this.initBackgroundColor});

  final Color initBackgroundColor;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with RouteAware {
  late ScrollController controller;
  late Color overrideBackgroundColor;
  late final FocusNode contactMeFocusNode;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);

    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void initState() {
    super.initState();
    contactMeFocusNode = FocusNode();

    overrideBackgroundColor = widget.initBackgroundColor;
    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    setState(() {
      overrideBackgroundColor = AppColors.background;
    });
    super.didPopNext();
  }

  Future<void> scrollToEnd() async {
    await controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      SizedBox(height: 40.spMin),
      const Avatar(),
      SizedBox(height: 20.spMin),
      const Links(),
      SizedBox(height: 40.spMin),
      const IntroText(),
      SizedBox(height: 40.spMin),
      ContactMe(onPressed: ()async{
        await Future.delayed(Duration(milliseconds: 200));
       await scrollToEnd();
       TextInput.finishAutofillContext();
       contactMeFocusNode.requestFocus();
      }),
      SizedBox(height: 40.spMin),
    ];
    final EdgeInsets padding = EdgeInsets.only(
      right: 20.w,
      left: 20.w,
      bottom: 10,
    );

    return PatternBackground(
      overrideBackgroundColor: overrideBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: gPadding(context.mediaQuerySize),
          child: Container(
            decoration: shadowDecoration(borderRadius: gBorderRadius),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Scaffold(
                body: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(
                    context,
                  ).copyWith(scrollbars: false),
                  child: CustomScrollView(
                    controller: controller,
                    slivers: [
                      SliverPadding(
                        padding: padding.copyWith(top: 10.h),
                        sliver: HeaderSliver(
                          onTap: () {
                            controller.animateTo(
                              0,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: LiveSliverList.options(
                          itemCount: body.length,
                          controller: controller,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                            Animation<double> animation,
                          ) {
                            if (body[index] is SizedBox) return body[index];
                            return ItemAnimationBuilder(
                              animation: animation,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: body[index],
                              ),
                            );
                          },
                          options: LiveOptions(
                            showItemInterval: showItemDuration,
                            showItemDuration: showItemInterval,
                            reAnimateOnVisibility: true,
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: const SectionTitle(
                          text: 'HIGHLIGHTED PROJECTS',
                          icon: Assets.iconsHighlightedProjectsIcon,
                        ),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: ProjectsView(
                          controller: controller,
                          onProjectPressed: (Project project) async {
                            setState(() {
                              overrideBackgroundColor = AppColors.primary;
                            });
                            context.goNamed(
                              Routes.highlightedProjects,
                              pathParameters: {
                                Routes.highlightedProjectsId: project.path,
                              },
                            );
                          },
                        ),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: const SectionTitle(
                          text: 'CONTACT ME',
                          icon: Assets.iconsContactMeIcon,
                        ),
                      ),
                      SliverPadding(
                        padding: padding,
                        sliver: ContactMeBody(
                          controller: controller,
                          scrollToEnd: scrollToEnd, focusNode: contactMeFocusNode,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
