import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/globals/global_elements.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/custom_tooltip.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

final MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
  a: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
  p: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
  code: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
  h1: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w100),
  h2: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
  h3: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600),
  h4: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600),
  h5: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500),
  h6: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500),
  em: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic),
  strong: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
  del: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.lineThrough),
  blockquote:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
  listBullet:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
  tableHead: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold),
  tableBody:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal),
);

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
          decoration: shadowDecoration(
              borderRadius: gBorderRadius,
              hideShadow: true,
              color: AppColors.scaffoldBackground),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.spMax,
                ),
                SizedBox(
                  height: 180.sp,
                  width: 180.sp,
                  child: PhotoWidget(
                    photoPath: project.cover,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 30.spMax,
                ),
                Text(
                  project.name,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 11.spMax,
                ),
                Text(
                  project.shortDescription,
                  style: context.textTheme.bodySmall,
                ),
                SizedBox(
                  height: 30.spMax,
                ),
                Wrap(
                  children: project.links
                      .map<Widget>((e) => CustomTooltip(
                          message: e.tooltip,
                          child: CupertinoButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            child: Icon(
                              IoniconsData(int.parse(e.icon)),
                              color: AppColors.secondary,
                              size: 24.spMax,
                            ),
                          )))
                      .toList(),
                ),
                SizedBox(
                  height: 50.spMax,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description:',
                    style: context.textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: 11.spMax,
                ),
                MarkdownBody(
                  data: project.description,
                  styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
                  styleSheet: markdownStyleSheet,
                ),
                SizedBox(
                  height: 15.spMax,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Photos:',
                    style: context.textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: 11.spMax,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
