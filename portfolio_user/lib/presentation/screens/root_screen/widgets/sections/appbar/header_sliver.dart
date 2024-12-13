import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/sections/appbar/drawer_icon.dart';

class HeaderSliver extends StatelessWidget {
  const HeaderSliver({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeUp,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: AppColors.scaffoldBackground.withValues(alpha: .5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          ),
        ),
      ),
    );
  }
}
