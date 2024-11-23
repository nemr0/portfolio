import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/presentation/helpers/shadow_decoration.dart';
import 'package:portfolio/presentation/shared_widgets/error_widget.dart';
import 'package:portfolio/presentation/shared_widgets/loading_photo.dart';
import 'package:portfolio_shared/domain/remote_source/cdn/cloud_flare/cloudflare_cdn.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    super.key,
    required this.photoPath,
    this.height,
    this.width,
  });

  final String photoPath;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final photoLink = CloudflareCDN().getPhotoUrl(photoPath);
    if (photoPath.endsWith('.svg')) {
      return SvgPicture.network(
        photoLink,
        placeholderBuilder: (_) => const LoadingPhoto(),
        fit: BoxFit.fitWidth,
        height: height,
        width: width,
      );
    }
    return CachedNetworkImage(
      imageUrl: photoLink,
      errorWidget: (_, __, ___) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: shadowDecoration(borderRadius: BorderRadius.circular(10)),
            child: CustomErrorWidget.fromText(message: 'Something went wrong.')),
      ),
      placeholder: (_, __) => const LoadingPhoto(),
      fit: BoxFit.fitWidth,
      height: height,
      width: width,
    );
  }
}
