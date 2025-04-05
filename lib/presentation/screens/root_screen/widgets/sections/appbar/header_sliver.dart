import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/generated/assets.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.asset(
                      Assets.webpLogo,
                      height: context.mobile ? 41.spMin : 55.spMin,
                    ),
                    const Spacer(),
                    CupertinoButton(
                        padding: EdgeInsets.all(2),
                        sizeStyle: CupertinoButtonSize.small,

                        onPressed: () {
                          // should show details about this like it's created with flutter , pocketbase and deployed on cloudflare
                          showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(
                            title: const Text('About this portfolio'),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(
                                text: 'This webapp is created with\n\n',
                                style: TextStyle(color: AppColors.textColor,),
                                children: [WidgetSpan(child: FlutterLogo(size: 12.sp,)),
                                  const TextSpan(text: ' Flutter Web\n\n and hosted on\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpCloudflare,height: 10.sp,)),
                                  const TextSpan(text: ' Cloudflare Pages\n\n and uses\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpPocketbase,height: 12.sp,)),
                                  const TextSpan(text: ' PocketBase\n\n as backend, hosted on\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpRailway,height: 12.sp,)),
                                  const TextSpan(text: ' Railway'),



                                ]
                              )),
                            ),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  launchUrl(Uri.parse('https://github.com/nemr0'));
                                  Navigator.pop(context);
                                },
                                child: const Text('Repo on Github'),
                              ),
                            ],
                          ),barrierDismissible: true);
                        },
                    child: Icon(Icons.info_rounded,color: AppColors.primary,)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
