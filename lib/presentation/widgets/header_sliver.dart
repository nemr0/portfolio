import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/widgets/drawer_icon.dart';

class HeaderSliver extends StatelessWidget {
  const HeaderSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: Container(
        color: AppColors.scaffoldBackground.withOpacity(.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.ASSETS_WEBP_LOGO_WEBP,
              height: context.mobile ? 41.spMin : 55.spMin,
            ),
            const DrawerIcon(),
          ],
        ),
      ),
    );
  }
}
