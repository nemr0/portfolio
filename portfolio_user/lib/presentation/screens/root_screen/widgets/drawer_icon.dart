import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/font_settings.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerIcon extends StatefulWidget {
  const DrawerIcon({super.key});

  @override
  State<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon> with SingleTickerProviderStateMixin {

  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  static const _itemTheme = PullDownMenuItemTheme(
      textStyle: TextStyle(color: Colors.white, fontFamily: FontSettings.kFontWorkSans),
      iconActionTextStyle: TextStyle(color: Colors.white, fontFamily: FontSettings.kFontWorkSans),
      subtitleStyle: TextStyle(color: Colors.white54, fontFamily: FontSettings.kFontWorkSans),
      onHoverBackgroundColor: AppColors.background,
      onPressedBackgroundColor: AppColors.primary,
      onHoverTextColor: AppColors.textColor,
  );

  static final _routeTheme = PullDownMenuRouteTheme(backgroundColor: Colors.grey[850]);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'drawer-icon',
      child: Tooltip(
        message: 'Links',
        textStyle: TextStyle(
          color: AppColors.textColor,
          fontFamily: FontSettings.kFontWorkSans,
        ),
        decoration: BoxDecoration(color: AppColors.primary),
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
                              fontFamily: FontSettings.kFontWorkSans),
                          title: Center(
                              child: Text(
                            'Links',
                            textAlign: TextAlign.center,
                          ))),
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
                                  Uri.parse('https://dribbble.com/omarelnemr',), webOnlyWindowName: '_self');
                            },
                            title: 'Dribbble',
                            icon: Ionicons.logo_dribbble,
                          ),
                        ],
                      ),
                      PullDownMenuActionsRow.medium(
                        items: [
                          PullDownMenuItem(
                            itemTheme: _itemTheme,
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                    'https://www.tiktok.com/@nemrdev',
                                  ),
                                  webOnlyWindowName: '_self');
                            },
                            title: 'Tiktok',
                            icon: Ionicons.logo_tiktok,
                          ),
                          PullDownMenuItem(
                            itemTheme: _itemTheme,
                            onTap: () {
                              launchUrl(
                                  Uri.parse(
                                    'https://www.instagram.com/nemrdev/',
                                  ),
                                  webOnlyWindowName: '_self');
                            },
                            title: 'Instagram',
                            icon: Ionicons.logo_instagram,
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
      ),
    );
  }
}
