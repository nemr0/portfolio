import 'package:flutter/material.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingPhoto extends StatelessWidget {
  const LoadingPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: AppColors.background.withOpacity(.7),
        highlightColor: AppColors.scaffoldBackground,
        duration: Duration(seconds: 1),
      ),
      enabled: true,
      // containersColor: Colors.white54,
      child: Image.asset(
        AppAssets.ASSETS_WEBP_AVATAR_WEBP,
        fit: BoxFit.cover,
      ),
    );
  }
}