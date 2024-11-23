import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/components/project_list.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key, required this.controller, required this.onProjectPressed});

  final ScrollController controller;
  final Function(Project project) onProjectPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProjectsCubit, GetProjectsState>(
        builder: (context, state) {
      return state.when<Widget>(
        loading: () => ProjectsListWidget(
          controller: controller,
        ),
        success: (projects) => ProjectsListWidget(
          projects: projects,
          controller: controller,
          onProjectPressed: onProjectPressed,
        ),
        error: (e) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration:
                  shadowDecoration(borderRadius: BorderRadius.circular(10)),
              child: CustomErrorWidget.fromText(
                  message: e.message ?? 'Something went wrong!')),
        ),
      );
    });
  }
}





