import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/globals/global_elements.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/custom_tooltip.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

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
              if (current)
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
                            color: AppColors.secondary,
                          ),
                        ),
                      )),
                )
              else
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
                            color: Colors.transparent,
                          ),
                        ),
                      )),
                ),
              Padding(
                padding: horizontalPadding,
                child: ProjectBottomSheetItemTitle(
                  project: project,
                  loading: loading,
                ),
              ),
              Padding(
                padding: horizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Description:',
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              Padding(
                padding: horizontalPadding,
                child: MarkdownBody(
                  data: project.description,
                  styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
                  styleSheet: markdownStyleSheet,
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
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                height: 11.spMax,
              ),
              NotificationListener(
                onNotification: (notification)=>true,
                child: SizedBox(
                  height: 278.sp,
                  child: ListView.separated(
                    padding: horizontalPadding,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => PhotoWidget(
                      photoPath: project.photos[index],
                      borderRadius: BorderRadius.circular(10),
                      height: 278.sp,
                      width: 147.sp,
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

class ProjectBottomSheetItemTitle extends StatelessWidget {
  const ProjectBottomSheetItemTitle(
      {super.key, required this.project, required this.loading});

  final Project project;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    buildCover([double? side]) => SizedBox(
          height: side ?? 180.sp,
          width: side ?? 180.sp,
          child: Hero(
            tag: loading ? UniqueKey().toString() : project.cover,
            child: PhotoWidget(
              photoPath: project.cover,
              borderRadius: BorderRadius.circular(10),
              loading: loading,
            ),
          ),
        );
    buildProjectName() => Text(
          project.name,
          style: context.textTheme.bodyMedium,
        );
    buildShortDescription() => Text(
          project.shortDescription,
          style: context.textTheme.bodySmall,
          maxLines: 3,
        );
    buildIcons() => Wrap(
          spacing: context.mobile?6:10,
          children: project.links
              .map<Widget>((e) => CustomTooltip(
                  message: e.tooltip,
                  child: CupertinoButton(
                    onPressed: () {
                      launchUrl(Uri.parse(e.link));
                    },
                    padding: EdgeInsets.zero,
                    child: Icon(
                      IoniconsData(int.parse(e.icon)),
                      color: AppColors.secondary,
                      size: 24.spMax,
                    ),
                  )))
              .toList(),
        );
    if (context.mobile) {
      return Column(
        children: [
          SizedBox(
            height: 20.spMax,
          ),
          buildCover(),
          SizedBox(
            height: 30.spMax,
          ),
          buildProjectName(),
          SizedBox(
            height: 11.spMax,
          ),
          buildShortDescription(),
          SizedBox(
            height: 30.spMax,
          ),
          buildIcons(),
          SizedBox(
            height: 50.spMax,
          ),
        ],
      );
    }
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.spMax),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCover(),
            SizedBox(
              width: 20.spMax,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.spMax,
                  ),
                  Flexible(child: FittedBox(child: buildProjectName())),
                  Flexible(child: FittedBox(child: buildShortDescription())),
                  SizedBox(
                    height: 20.spMax,
                  ),
                  buildIcons(),
                  SizedBox(
                    height: 20.spMax,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
