import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/globals/global_elements.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

class ProjectItemSheetView extends StatelessWidget {
  const ProjectItemSheetView({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: Padding(
        padding: gPadding(context.mediaQuerySize),
        child: Container(

          decoration: shadowDecoration(borderRadius: gBorderRadius,),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 20.spMax,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PhotoWidget(photoPath: project.cover,
                  height: 180,
                    width: 180,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
