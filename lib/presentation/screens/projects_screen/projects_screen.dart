import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/screens/projects_screen/widgets/single_project_widget.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio/data/models/project/project.dart';


class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key, required this.projectId});

  final String projectId;

  @override
  State<ProjectsScreen> createState() =>
      _ProjectsScreenState();
}

class _ProjectsScreenState
    extends State<ProjectsScreen> {
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
        if(state is GetProjectsLoading||state is GetProjectsError) {
          controller.jumpToPage(1);
        }else if(state is GetProjectsSuccess) {
          int index = state.data.indexWhere((e) => e.path == widget.projectId);
          if (index != -1) {
            delayedJumpTo(index);
          }        }
      },
      builder: (_, state) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),

          child: PageView.builder(
            onPageChanged: (p) {
              setState(() => currentIndex = p);
              if(state is GetProjectsSuccess) {
                context.goNamed(Routes.highlightedProjects, pathParameters: {
                  Routes.highlightedProjectsId: state.data[p].path
                });
              }

            },
            controller: controller,
            physics: !useDefaultPadding
                ? NeverScrollableScrollPhysics()
                : BouncingScrollPhysics(parent: PageScrollPhysics()),
            itemBuilder: (BuildContext context, int index) {
              return NotificationListener<ScrollNotification>(
                onNotification: scrollNotificationHandler,
                child: switch(state){
                  GetProjectsLoading() => SingleProjectWidget(
                    project: emptyProject,
                    loading: true,
                    current: index == currentIndex,
                  ),
                  GetProjectsSuccess() => NotificationListener<ScrollNotification>(
                    child: SingleProjectWidget(
                      project: state.data[index],
                      current: index == currentIndex,
                      // controller: scrollController,
                      useDefaultPadding: useDefaultPadding,
                    ),
                  ),
                  GetProjectsError() => ItemErrorWidget(
                    exception: state.exception,
                    width: double.infinity, onRetryPressed: () async{
                      GetProjectsCubit.get(context).getData(reload: true);
                  },

                  ),
                  GetProjectsState() => SizedBox(),
                }
              );
            },
            itemCount: switch(state){
              GetProjectsLoading() => 3,
              GetProjectsSuccess() => state.data.length,
              GetProjectsError() => 3,
              GetProjectsState() => 0,
            },
          ),
        );
      },
    );
  }
}
