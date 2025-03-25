
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart' show ImageRenderMethodForWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/shared_widgets/loading_photo.dart';

import 'error_widget.dart' show ItemErrorWidget;
class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.photoPath,
    this.height,
    this.width,
    this.isIcon=false,  this.loading = false,
  });

  final String photoPath;
  final double? height;
  final double? width;
  final bool loading;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    if(loading) {
      return SizedBox(
        height: height,
        width: width,
        child: const LoadingPhoto());
    }
    if (photoPath.contains('.svg')) {
      return Container(
        decoration: isIcon == false ?  BoxDecoration(
          border: Border.all(color: AppColors.primary,width: 3),
        ) : null,
        child: SvgPicture.network(
          photoPath,
          placeholderBuilder: (_) => const LoadingPhoto(),
          fit: BoxFit.fitWidth,
          height: height,
          width: width,
        ),
      );
    }
    return Container(
      height: height,
     width: width,
     decoration: isIcon == false ? BoxDecoration(
       color: AppColors.primary,
       border: Border.all(color: AppColors.primary,width: 3),
     ) : null,
      child: CachedNetworkImage(
        imageUrl: photoPath,
        imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
        fit: BoxFit.contain,
        errorWidget: (_, e, s) {
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
    );
  }
}
