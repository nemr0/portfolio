import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/presentation/shared_widgets/loading_photo.dart';


class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.isIcon = false,
    this.loading = false,
    this.borderRadius = BorderRadius.zero,
  });

  final String url;
  final double? height;
  final double? width;
  final bool loading;
  final bool isIcon;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Builder(
        builder: (_) {
          final loadingImage = SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: const LoadingPhoto(),
            ),
          );
          if (loading) {
            return loadingImage;
          }
          // if (url.contains('.svg')) {
          //   return Container(
          //     decoration: isIcon == false ?  BoxDecoration(
          //       border: Border.all(color: AppColors.primary,width: 3),
          //     ) : null,
          //     child: ClipRRect(
          //       borderRadius: borderRadius,
          //       child: SvgPicture.network(
          //         url,
          //         placeholderBuilder: (_) => const LoadingPhoto(),
          //         fit: BoxFit.fitWidth,
          //         height: height,
          //         width: width,
          //       ),
          //     ),
          //   );
          // }
          return Container(
            height: height,
            width: width,
            decoration:
                isIcon == false
                    ? BoxDecoration(
                      color: AppColors.primary,
                      border: Border.all(color: AppColors.primary, width: 3),
                    )
                    : null,
            child: CachedNetworkImage(
              imageUrl: url,
              // imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
              fit: BoxFit.contain,
              memCacheWidth: width?.round(),
              memCacheHeight: height?.round(),
              errorWidget: (_, e, s) {
                return Icon(
                  Icons.warning_rounded,
                  size: width,
                  color: isIcon ? AppColors.secondary : AppColors.background,
                );
              },
              // errorWidget: (_, e, s) {
              //   return Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ItemErrorWidget.fromText(
              //         width: 100.w,
              //         message: 'Something went wrong.'),
              //   );
              // },
              placeholder: (_, __) => loadingImage,
            ),
          );
        },
      ),
    );
  }
}
