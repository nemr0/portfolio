import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:portfolio_shared/domain/remote_source/cdn/cloud_flare/cloudflare_cdn.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PhotoViewBottomSheet extends StatelessWidget {
  const PhotoViewBottomSheet({
    super.key,
    required this.project,
    required this.horizontalPadding, required this.initialPhoto,
  });

  final Project project;
  final EdgeInsets horizontalPadding;
  final int initialPhoto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
            pageController:PageController(initialPage: initialPhoto),
            backgroundDecoration: BoxDecoration(color: AppColors.background.withValues(alpha: .9),image: DecorationImage(image: AssetImage(AppAssets.ASSETS_WEBP_BACKGROUND_PATTERN_WEBP,),  scale: 3,
              opacity: .75,)),
            itemCount: project.photos.length,
            builder: (_,index)=>  PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(CloudflareCDN().getPhotoUrl(project.photos[index])),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              errorBuilder: (_,__,___){

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ItemErrorWidget.fromText(
                      width: 100.w,
                      message: 'Something went wrong.'),
                );

              },
              heroAttributes: PhotoViewHeroAttributes(tag: '${project.name}-photo:${project.photos[index]}'),
            )),
        Padding(
          padding: horizontalPadding.copyWith(top: 20.w),
          child: Align(
              alignment: Alignment.topLeft,
              child: Skeleton.ignore(
                child: CupertinoButton(
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  child: Container(
                    height:30.sp,
                    width:30.sp,
                    decoration:BoxDecoration(shape: BoxShape.circle,color: AppColors.background),
                    child: Icon(
                      Ionicons.close_circle,
                      size: 30.sp,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}