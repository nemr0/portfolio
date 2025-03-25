import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/presentation/shared_widgets/custom_tooltip.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:portfolio/extensions/context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectBottomSheetItemTitle extends StatelessWidget {
  const ProjectBottomSheetItemTitle(
      {super.key, required this.project, required this.loading, required this.current});

  final Project project;
  final bool loading;
  final bool current;

  @override
  Widget build(BuildContext context) {
    buildCover([double? side]) => SizedBox(
      height: side ?? 180.sp,
      width: side ?? 180.sp,
      child: Hero(
        tag: loading || !current ? UniqueKey().toString() : project.cover,
        child: PhotoWidget(
          photoPath: project.cover,
          loading: loading,
        ),
      ),
    );
    buildProjectName(TextStyle? bodyMedium) => Text(
      project.name,
      style: bodyMedium,
    );
    buildShortDescription(TextStyle? bodySmall) => Text(
      project.shortDescription,
      style: bodySmall,
      maxLines: 3,
    );
    buildIcons(bool mobile) => Wrap(
      spacing: mobile?6:10,
      children: project.links
          .map<Widget>((e) => CustomTooltip(
          message: e.tooltip,
          child: CupertinoButton(
            onPressed: () {
              launchUrl(Uri.parse(e.link));
            },
            padding: EdgeInsets.zero,
            child: PhotoWidget(
              isIcon: true,
              height: 24.spMax,width: 24.spMax, photoPath: e.icon,
            ),
          )))
          .toList(),
    );
    if (context.mediaQuerySize.shortestSide<875) {
      return Column(
        children: [
          buildCover(),
          SizedBox(
            height: 30.spMax,
          ),
          buildProjectName(context.textTheme.bodyMedium),
          SizedBox(
            height: 11.spMax,
          ),
          buildShortDescription(context.textTheme.bodySmall),
          SizedBox(
            height: 30.spMax,
          ),
          buildIcons(context.mobile),

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
                  Expanded(child: FittedBox(child: buildProjectName(context.textTheme.bodyMedium))),
                  Flexible(
                    fit: FlexFit.tight,child: buildShortDescription(context.textTheme.bodySmall),),
                  SizedBox(
                    height: 20.spMax,
                  ),
                  buildIcons(context.mobile),
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
