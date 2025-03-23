import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/bottom_sheets/project_modal_sheet/project_bottom_sheet.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio/data/models/project/project.dart';

class ProjectsPageViewBottomSheet extends StatefulWidget {
  const ProjectsPageViewBottomSheet({super.key, required this.projectId});

  final String projectId;

  @override
  State<ProjectsPageViewBottomSheet> createState() =>
      _ProjectsPageViewBottomSheetState();
}

class _ProjectsPageViewBottomSheetState
    extends State<ProjectsPageViewBottomSheet> {
  late PageController controller;
  late int currentIndex;
  bool useDefaultPadding = true;

  // listener(){
  //   if(scrollController.offset>=100){
  //     if(useDefaultPadding == true) {
  //       setState(() {
  //         useDefaultPadding = false;
  //       });
  //
  //     }
  //   }else{
  //     if(useDefaultPadding == false) {
  //       setState(() {
  //         useDefaultPadding=true;
  //       });
  //
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    currentIndex = GetProjectsCubit.get(context).loadOrEmitSuccess(widget.projectId) ?? 0;
    controller = PageController(initialPage: currentIndex, viewportFraction: .95);
    // scrollController =ScrollController();
    // scrollController.addListener(listener);
  }

  @override
  void dispose() {
    controller.dispose();
    // scrollController.removeListener(listener);
    // scrollController.dispose();
    super.dispose();
  }

  bool scrollNotificationHandler(ScrollNotification notification) {
    if (notification.metrics.pixels >= 10) {
      if (useDefaultPadding == true) {
        setState(() {
          useDefaultPadding = false;
          controller = PageController(initialPage: currentIndex, viewportFraction: 1);
        });
      }
    } else {
      if (useDefaultPadding == false) {
        setState(() {
          useDefaultPadding = true;
          controller = PageController(initialPage: currentIndex, viewportFraction: .95);
        });
      }
    }
    return true;
  }
  delayedJumpTo(int index)=> Future.delayed(Duration(milliseconds: 100), () {
    try{
          if (mounted) controller.jumpToPage(index);
          setState(() {
            currentIndex=index;
          });
        }catch(_){
      delayedJumpTo(index);
    }
      });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProjectsCubit, GetProjectsState>(
      listener: (_, state) {
        state.whenOrNull(loading: () {
          delayedJumpTo(1);
          }, success: (projects) {
          int index = projects.indexWhere((e) => e.path == widget.projectId);
          if (index != -1) {
           delayedJumpTo(index);
          }
        }, error: (_) {
          delayedJumpTo(1);
        });
      },
      builder: (_, state) {
        return PageView.builder(
          onPageChanged: (p) {
            setState(() => currentIndex = p);
            state.whenOrNull(success: (projects) =>
              context.goNamed(Routes.highlightedProjects, pathParameters: {
                Routes.highlightedProjectsId: projects[p].path
              }),
            );
          },
          controller: controller,
          physics: !useDefaultPadding
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(parent: PageScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return NotificationListener<ScrollNotification>(
              onNotification: scrollNotificationHandler,
              child: state.when<Widget>(
                loading: () => ProjectItemSheetView(
                  project: emptyProject,
                  loading: true,
                  current: index == currentIndex,
                ),
                success: (projects) => NotificationListener<ScrollNotification>(
                  child: ProjectItemSheetView(
                    project: projects[index],
                    current: index == currentIndex,
                    // controller: scrollController,
                    useDefaultPadding: useDefaultPadding,
                  ),
                ),
                error: (error) => ItemErrorWidget(
                  exception: error,
                  width: double.infinity,
                ),
              ),
            );
          },
          itemCount: state.when(
              loading: () => 3,
              error: (_) => 3,
              success: (projects) => projects.length),
        );
      },
    );
  }
}
