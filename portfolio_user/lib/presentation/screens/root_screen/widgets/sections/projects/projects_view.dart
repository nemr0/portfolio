import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/core/const/animation_durations.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/shared_widgets/item_animation_builder.dart';
import 'package:portfolio/presentation/shared_widgets/scaler.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProjectsCubit, GetProjectsState>(
        builder: (context, state) {
      return state.when<Widget>(
        loading: () => const ProjectsListWidget(),
        success: (projects) => ProjectsListWidget(projects: projects),
        error: emptyBuilder,
      );
    });
  }
}

Widget emptyBuilder([dynamic value]) => const SizedBox();

class ProjectsListWidget extends StatelessWidget {
  const ProjectsListWidget(
      {super.key, this.projects});

  final List<Project>? projects;

  @override
  Widget build(BuildContext context) {
    return AnimateIfVisibleWrapper(
      showItemInterval: showItemInterval,
      child: MasonryGridView.count(
        shrinkWrap: true,
        crossAxisCount: context.mobile ? 2 : 4,
        mainAxisSpacing: context.mobile ? 2 : 4,
        crossAxisSpacing: context.mobile ? 2 : 4,
        itemCount: projects?.length??6,
        itemBuilder: (context, index) => AnimateIfVisible(
          key: ValueKey('${projects?[index].cover??'item'}:$index'),
          builder: (BuildContext context, Animation<double> animation) =>
              ItemAnimationBuilder(
            animation: animation,
            child: ProjectViewItem(
              project: projects?[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectViewItem extends StatelessWidget {
  const ProjectViewItem(
      {super.key, required this.project});

  final Project? project;

  @override
  Widget build(BuildContext context) {
    if(project == null) return ProjectLoadingItem();
    return Hero(
      tag: project!.cover,
      child: ScaleEffect(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              // TODO: implement onProjectPressed.
            },
            child: CachedNetworkImage(
              imageUrl: project!.cover,
              errorWidget: (_,__,___)=>Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: shadowDecoration(borderRadius: BorderRadius.circular(10 )),
                    child: CustomErrorWidget.fromText(message: 'Something went wrong.')),
              ),
              placeholder: (_, __) => const ProjectLoadingItem(),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectLoadingItem extends StatelessWidget {
  const ProjectLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: shadowDecoration(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
