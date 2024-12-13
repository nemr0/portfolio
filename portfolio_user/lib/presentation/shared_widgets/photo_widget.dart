
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/shared_widgets/loading_photo.dart';
import 'package:portfolio_shared/domain/remote_source/cdn/cloud_flare/cloudflare_cdn.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.photoPath,
    this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,  this.loading = false,
  });

  final BorderRadius borderRadius;
  final String photoPath;
  final double? height;
  final double? width;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    if(loading) {
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              decoration:  BoxDecoration(borderRadius: borderRadius,),
              child: const LoadingPhoto()),
          ],
        ),
      );
    }
    final photoLink = CloudflareCDN().getPhotoUrl(photoPath);

    if (photoPath.endsWith('.svg')) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary,width: 3),
          borderRadius: borderRadius,),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: SvgPicture.network(
            photoLink,
            placeholderBuilder: (_) => const LoadingPhoto(),
            fit: BoxFit.fitWidth,
            height: height,
            width: width,
          ),
        ),
      );
    }
    return Container(
      height: height,
     width: width,
     decoration: BoxDecoration(
       color: AppColors.primary,
       border: Border.all(color: AppColors.secondary,width: 3),
       borderRadius: borderRadius,),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: photoLink,
          imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
          fit: BoxFit.fitWidth,
          errorWidget: (_, __, ___) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemErrorWidget.fromText(
                width: 100.w,
                  message: 'Something went wrong.'),
            );
          },
          placeholder: (_, __) => SizedBox(
              height: height,
              width: width,
              child: const LoadingPhoto()),
        ),
      ),
    );
  }
}
