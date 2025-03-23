import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/components/project_item.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/extensions/context_extension.dart';

class ProjectsListWidget extends StatelessWidget {
  const ProjectsListWidget(
      {super.key, this.projects, required this.controller, this.onProjectPressed});

  final List<Project>? projects;
  final ScrollController controller;
  final Function(Project project)? onProjectPressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      sliver: LiveSliverGrid(
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
              child: ProjectViewItem(
                project: projects?[index], onProjectPressed: onProjectPressed,
              ),
            ),
        itemCount: projects?.length ?? 4,
        controller: controller,
      ), padding: EdgeInsets.only(right: context.mobile?0:context.width*.3),
    );
  }
}
