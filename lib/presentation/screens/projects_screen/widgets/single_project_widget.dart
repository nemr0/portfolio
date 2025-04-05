import 'package:flutter/cupertino.dart' show CupertinoButton, CupertinoTextSelectionControls;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart' show Ionicons;
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/screens/projects_screen/widgets/project_title_widget.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/photo_widget.dart';
import 'package:portfolio/data/models/project/project.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/globals/global_elements.dart' show gBorderRadius;




class SingleProjectWidget extends StatelessWidget {
   MarkdownStyleSheet markdownStyleSheet ()=> MarkdownStyleSheet(
    textAlign: WrapAlignment.start,
    a: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.spMin),
    p: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.spMin),
    code: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 14.spMin),
    h1: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w100, fontSize: 32.spMin),
    h2: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 28.spMin),
    h3: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 24.spMin),
    h4: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w600, fontSize: 20.spMin),
    h5: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500, fontSize: 18.spMin),
    h6: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w500, fontSize: 16.spMin),
    em: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
        fontSize: 16.spMin),
    strong: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 16.spMin),
    del: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.lineThrough,
        fontSize: 16.spMin),
    blockquote:
    TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 18.spMin),
    listBullet:
    TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.spMin),
    tableHead: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 16.spMin),
    tableBody:
    TextStyle(color: AppColors.textColor, fontWeight: FontWeight.normal, fontSize: 16.spMin),
    codeblockDecoration: BoxDecoration(color: AppColors.codeBlockBG,borderRadius: BorderRadius.circular(5.spMax)),
    codeblockPadding: EdgeInsets.all(12.spMin),
    blockquoteDecoration: BoxDecoration(color: AppColors.codeBlockBG),
  );
  const SingleProjectWidget(
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
        EdgeInsets.only(top: 20.spMax, left: 3.spMax, right: 3.spMax);
    final horizontalPadding = EdgeInsets.symmetric(horizontal: 20.w);
    final List<Widget> children=[

      SizedBox(
        height: 20.spMax,
      ),
      Padding(
        padding: horizontalPadding,
        child: ProjectTitleWidget(
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
      NotificationListener(
        onNotification: (_)=>true,
        child: SelectableRegion(
          focusNode: FocusNode(),
          selectionControls: CupertinoTextSelectionControls(),
          child: Padding(
            padding: horizontalPadding,
            child: Align(
              alignment: Alignment.centerLeft,

              child: MarkdownBody(
                data: project.description,
                styleSheetTheme: MarkdownStyleSheetBaseTheme.cupertino,
                styleSheet: markdownStyleSheet(),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15.spMax,
      ),
      if(project.photos.isNotEmpty) Padding(
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


    ];
    return Skeletonizer(
      enabled: loading,
      ignorePointers: false,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: useDefaultPadding ? defaultPadding : EdgeInsets.zero,
        decoration: shadowDecoration(
            borderRadius: useDefaultPadding ? gBorderRadius : BorderRadius.zero,
            hideShadow: true,
            color: AppColors.scaffoldBackground),
        child: CustomScrollView(
          slivers: [
            PinnedHeaderSliver(
              child:  Padding(
                padding: horizontalPadding.copyWith(top: 20.h),
                child: Skeleton.keep(
                  keep: true,
                  child: Row(
                    children: [
                      CupertinoButton(
                        onPressed: () => context.pop(),
                        padding: EdgeInsets.zero,
                        child: Container(
                          height:30.sp,
                          width:30.sp,
                          decoration:BoxDecoration(shape: BoxShape.circle,color: AppColors.textColor),
                          child: Icon(
                            Ionicons.close_circle,
                            size: 30.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Spacer(),
                  
                      CupertinoButton(
                        onPressed: () {
                          Share.share(Uri.base.toString(),subject: 'Check out this project: ${project.name}');
                        },
                        padding: EdgeInsets.zero,
                        child: Icon(
                          Ionicons.share_social_outline,
                          size: 18.sp,
                          color: AppColors.primary,
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate((_,index)=>children[index],childCount: children.length),),
            if(project.photos.isNotEmpty)  SliverToBoxAdapter(
              child: NotificationListener(
                onNotification: (notification)=>true,
                child: SizedBox(
                  height: 403.sp,
                  child: ListView.separated(
                    padding: horizontalPadding,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => PhotoWidget(
                      url: project.photos[index],
                      height: 403.sp,
                      width: 193.sp,
                      loading: loading,
                      isIcon: true,
                      borderRadius: BorderRadius.circular(10.spMax),
                    ),
                    separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.spMax,),
                    itemCount: project.photos.length,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 200,),),
          ]
        ),
      ),
    );
  }
}



