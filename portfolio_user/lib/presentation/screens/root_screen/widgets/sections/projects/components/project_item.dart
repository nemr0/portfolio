import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/presentation/shared_widgets/loading_photo.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio/presentation/shared_widgets/scaler.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

class ProjectViewItem extends StatelessWidget {
  const ProjectViewItem({super.key, required this.project, required this.onProjectPressed});

  final Project? project;
  final Function(Project project)? onProjectPressed;

  @override
  Widget build(BuildContext context) {
    if (project == null) return LoadingPhoto();
    return Hero(
      tag: project!.cover,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.width/8,minWidth: context.width/5),
        child: ScaleEffect(
          child: GestureDetector(
            onTap:project==null?null:()=> onProjectPressed?.call(project!),
            child: PhotoWidget(photoPath: project!.cover,
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
        ),
      ),
    );
  }
}


