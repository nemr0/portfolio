import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart' show Ionicons;
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio/core/generated/fonts.gen.dart';
import 'package:portfolio/presentation/shared_widgets/custom_tooltip.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerIcon extends StatefulWidget {
  const DrawerIcon({super.key});

  @override
  State<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon>
    with SingleTickerProviderStateMixin {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  static const _itemTheme = PullDownMenuItemTheme(
    textStyle: TextStyle(color: Colors.white, fontFamily: FontFamily.workSans),
    iconActionTextStyle:
        TextStyle(color: Colors.white, fontFamily: FontFamily.workSans),
    subtitleStyle:
        TextStyle(color: Colors.white54, fontFamily: FontFamily.workSans),
    onHoverBackgroundColor: AppColors.background,
    onPressedBackgroundColor: AppColors.primary,
    onHoverTextColor: AppColors.textColor,
  );

  static final _routeTheme =
      PullDownMenuRouteTheme(backgroundColor: Colors.grey[850]);

  @override
  Widget build(BuildContext context) {
    return CustomTooltip(
      message: 'Links',
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: crossFadeState == CrossFadeState.showSecond
            ? null
            : () async {
                setState(() {
                  crossFadeState = CrossFadeState.showSecond;
                });
                RenderBox box = context.findRenderObject() as RenderBox;
                Offset offset = box.localToGlobal(Offset.zero);
                Size size = box.size;
                Rect position = offset & size;

                await showPullDownMenu(
                  context: context,
                  routeTheme: _routeTheme,
                  items: [
                    PullDownMenuTitle(
                        titleStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.workSans),
                        title: Text(
                          'Links',
                          textAlign: TextAlign.start,
                        )),
                    PullDownMenuActionsRow.medium(
                      items: [
                        PullDownMenuItem(
                          itemTheme: _itemTheme,
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                  'https://github.com/nemr0',
                                ),
                                webOnlyWindowName: '_self');
                          },
                          title: 'Github',
                          icon: Ionicons.logo_github,
                        ),
                        PullDownMenuItem(
                          itemTheme: _itemTheme,
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                  'https://www.linkedin.com/in/nemrdev/',
                                ),
                                webOnlyWindowName: '_self');
                          },
                          title: 'LinkedIn',
                          icon: Ionicons.logo_linkedin,
                        ),
                        PullDownMenuItem(
                          itemTheme: _itemTheme,
                          onTap: () {
                            launchUrl(
                                Uri.parse(
                                  'https://dribbble.com/omarelnemr',
                                ),
                                webOnlyWindowName: '_self');
                          },
                          title: 'Dribbble',
                          icon: Ionicons.logo_dribbble,
                        ),
                      ],
                    ),
                  ],
                  position: position,
                );
                setState(() {
                  crossFadeState = CrossFadeState.showFirst;
                });
              },
        child: AnimatedCrossFade(
            firstChild: Icon(
              Ionicons.link_outline,
              size: context.mobile ? 35.spMin : 55.spMin,
              color: AppColors.textColor,
            ),
            secondChild: Icon(
              Ionicons.unlink_outline,
              size: context.mobile ? 35.spMin : 55.spMin,
              color: AppColors.textColor,
            ),
            crossFadeState: crossFadeState,
            duration: Duration(milliseconds: 300)),
      ),
    );
  }
}
