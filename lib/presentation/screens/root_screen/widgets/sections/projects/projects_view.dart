import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/projects/components/project_cards.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio/data/models/project/project.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
    required this.controller,
    required this.onProjectPressed,
  });

  final ScrollController controller;
  final Function(Project project) onProjectPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProjectsCubit, GetProjectsState>(
      builder: (context, state) {
        if(state is GetProjectsSuccess) {
          return ProjectCards(
            projects: state.data,
            controller: controller,
            onProjectPressed: onProjectPressed,
          );
        }
        else if(state is GetProjectsError) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              width: 100,
              child: Icon(Icons.warning_rounded, size: 50),
            ),
          );
        } else {
          return ProjectCards(controller: controller);
        }

      },
    );
  }
}
