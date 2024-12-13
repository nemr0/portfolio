import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/routes/hero_page/show_cupertino_model_sheet_with_hero.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/bottom_sheets/project_modal_sheet/photo_view_bottom_sheet.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/bottom_sheets/project_modal_sheet/project_bottom_sheet_item_title.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/globals/global_elements.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';

final MarkdownStyleSheet markdownStyleSheet = MarkdownStyleSheet(
  textAlign: WrapAlignment.start,
  a: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.sp),
  p: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.sp),
  code: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 14.sp),
  h1: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w100, fontSize: 32.sp),
  h2: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 28.sp),
  h3: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 24.sp),
  h4: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 20.sp),
  h5: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500, fontSize: 18.sp),
  h6: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500, fontSize: 16.sp),
  em: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      fontSize: 16.sp),
  strong: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 16.sp),
  del: TextStyle(
      color: AppColors.textColor,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.lineThrough,
      fontSize: 16.sp),
  blockquote:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 18.sp),
  listBullet:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.sp),
  tableHead: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 16.sp),
  tableBody:
  TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.sp),
);


class ProjectItemSheetView extends StatelessWidget {
  const ProjectItemSheetView(
      {super.key,
      required this.project,
      this.loading = false,
      required this.current,
      this.useDefaultPadding = true});

  final Project project;
  final bool loading;
  final bool current;
  final bool useDefaultPadding;

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        EdgeInsets.only(top: 20.spMax, left: 10.spMax, right: 20.spMax);
    final horizontalPadding = EdgeInsets.symmetric(horizontal: 20.w);
    return Skeletonizer(
      enabled: loading,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: useDefaultPadding ? defaultPadding : EdgeInsets.zero,
        decoration: shadowDecoration(
            borderRadius: useDefaultPadding ? gBorderRadius : BorderRadius.zero,
            hideShadow: true,
            color: AppColors.scaffoldBackground),
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 10.h,),
          child: Column(
            children: [
                Padding(
                  padding: horizontalPadding,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Skeleton.ignore(
                        child: CupertinoButton(
                          onPressed: () => context.pop(),
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Ionicons.close_circle,
                            size: 30.sp,
                            color: current?AppColors.secondary:Colors.transparent,
                          ),
                        ),
                      )),
                ),
              SizedBox(
                height: 20.spMax,
              ),
              Padding(
                padding: horizontalPadding,
                child: ProjectBottomSheetItemTitle(
                  project: project,
                  loading: loading,
                  current: current,
                ),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              Divider(
                endIndent: 20.w,
                indent:20.w,
                color: AppColors.secondary.withValues(alpha: .3),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              Padding(
                padding: horizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description:',
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              Padding(
                padding: horizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,

                  child: MarkdownBody(
                    data: project.description,
                    styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
                    styleSheet: markdownStyleSheet,
                  ),
                ),
              ),
              SizedBox(
                height: 15.spMax,
              ),
              Padding(
                padding: horizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Photos:',
                    style: context.textTheme.bodyMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              NotificationListener(
                onNotification: (notification)=>true,
                child: SizedBox(
                  height: 322.sp,
                  child: ListView.separated(
                    padding: horizontalPadding,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => GestureDetector(
                      onTap: (){
                        showCupertinoModalSheetWithHeroEnabled(context: context, builder: (context)=>  PhotoViewBottomSheet(project: project, horizontalPadding: horizontalPadding,initialPhoto: index),);
                      },
                      child: Hero(
                        tag: '${project.name}-photo:${project.photos[index]}',
                        child: PhotoWidget(
                          photoPath: project.photos[index],
                          borderRadius: BorderRadius.circular(10),
                          height: 322.sp,
                          width: 154.4.sp,
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 19.spMax,),
                    itemCount: project.photos.length,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



