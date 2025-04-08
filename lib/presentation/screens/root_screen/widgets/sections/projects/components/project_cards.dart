import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/font_settings.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/components/single_project_card.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/core/extensions/context_extension.dart';

class ProjectCards extends StatelessWidget {
  const ProjectCards(
      {super.key, this.projects, required this.controller, this.onProjectPressed});

  final List<Project>? projects;
  final ScrollController controller;
  final Function(Project project)? onProjectPressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(right: context.mobile?0:context.width*.3),
      sliver: SliverMainAxisGroup(
        slivers: [
          LiveSliverGrid(
            reAnimateOnVisibility: true,
            showItemInterval: showItemInterval,
            showItemDuration: showItemDuration,
            // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), delegate: SliverChildBuilderDelegate((_,index)=> ProjectViewItem(
            // project: projects?[index], onProjectPressed: onProjectPressed,
            // ),),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),

              ],
            ),
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) =>
                ItemAnimationBuilder(
                  animation: animation,
                  fromGrid: true,
                  child: SingleProjectCard(
                    project: projects?[index], onProjectPressed: onProjectPressed,
                  ),
                ),
            itemCount: projects?.length ?? 4,
            controller: controller,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text('Click on the project to see more details', style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w100,
                color: AppColors.textColor.withAlpha(120),
                fontFamily: FontSettings.fontFamily
                // color: context.theme.colorScheme.onBackground.withOpacity(.5),
              ),),
            ),
          )
        ]
      ),
    );
  }
}
