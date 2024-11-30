import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/bottom_sheets/project_bottom_sheet.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

class ProjectsPageViewBottomSheet extends StatefulWidget {
  const ProjectsPageViewBottomSheet({super.key, required this.projectId});
  final String projectId;
  @override
  State<ProjectsPageViewBottomSheet> createState() =>
      _ProjectsPageViewBottomSheetState();
}

class _ProjectsPageViewBottomSheetState extends State<ProjectsPageViewBottomSheet> {
  late PageController controller;
  late int currentIndex;
  late final ScrollController scrollController;
  bool useDefaultPadding = true;
  listener(){
    if(scrollController.offset>=100){
      if(useDefaultPadding == true) {
        setState(() {
          useDefaultPadding = false;
        });

      }
    }else{
      if(useDefaultPadding == false) {
        setState(() {
          useDefaultPadding=true;
        });

      }
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex=GetProjectsCubit.get(context).loadOrEmitSuccess(widget.projectId)??0;
    controller = PageController(initialPage: currentIndex,viewportFraction: .9);
    scrollController =ScrollController();
    scrollController.addListener(listener);
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.removeListener(listener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProjectsCubit, GetProjectsState>(
      listener: (_,state) {
        state.whenOrNull(loading: () {
          controller.jumpToPage(1);
        }, success: (projects) {
         int index= projects.indexWhere((e)=>e.path==widget.projectId);
        if(index!=-1) {
            Future.delayed(Duration(milliseconds: 100), () {
              controller.jumpToPage(index);
            });
          }
        }, error: (_) {
          controller.jumpToPage(0);
        });
      },
      builder: (_, state) {
        return PageView.builder(
          onPageChanged: (p){
            setState(() =>currentIndex = p);
            state.whenOrNull(success: (projects){
              context.goNamed(Routes.highlightedProjects,pathParameters: {Routes.highlightedProjectsId:projects[p].path});
            });

          },
          controller: controller,
          physics:!useDefaultPadding?NeverScrollableScrollPhysics(): BouncingScrollPhysics(parent: PageScrollPhysics()),
          itemBuilder: (BuildContext context, int index) {
            return state.when<Widget>(
              loading: () => ProjectItemSheetView(
                project: emptyProject,
                loading: true,
                current: index == currentIndex,
              ),
              success: (projects) => ProjectItemSheetView(
                project: projects[index],
                current: index == currentIndex,
                controller: scrollController,
                useDefaultPadding: useDefaultPadding,
              ),
              error: (error) => ItemErrorWidget(
                exception: error,
                width: double.infinity,
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