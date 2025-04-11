import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/generated/assets.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
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
                    ShadowButton(
                        padding: EdgeInsets.all(2),
                        borderWidth: 1,

                        onPressed: () async{
                          // should show details about this like it's created with flutter , pocketbase and deployed on cloudflare
                          await showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(
                            title: const Text('About this portfolio'),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(
                                text: 'This webapp is created with\n\n',
                                style: TextStyle(color: AppColors.textColor,),
                                children: [WidgetSpan(child: FlutterLogo(size: 12.spMin,)),
                                  const TextSpan(text: ' Flutter Web\n\n and hosted on\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpCloudflare,height: 10.spMin,)),
                                  const TextSpan(text: ' Cloudflare Pages\n\n and uses\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpPocketbase,height: 12.spMin,)),
                                  const TextSpan(text: ' PocketBase\n\n as backend, hosted on\n\n'),
                                  WidgetSpan(child: Image.asset(Assets.webpRailway,height: 12.spMin,)),
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
                    child: Icon(Icons.info_rounded,color: AppColors.textColor,size: 16.sp,)),
                    ShadowButton(
                      borderWidth: 1,
                      onPressed: ()async{
                      await launchUrl(Uri.parse("https://api.whatsapp.com/send?phone=201147898061&text=Hey%20Omar%20%F0%9F%91%8B%2C%0AI%20need%20to%20contact%20you%20ASAP%20about%3A"));
                    },
                      child: Icon(Ionicons.logo_whatsapp,color: AppColors.textColor,size: 16.sp,),)
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
