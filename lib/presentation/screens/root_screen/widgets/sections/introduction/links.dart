import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart' show Ionicons;
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/generated/fonts.gen.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends StatelessWidget {
  const Links({super.key});
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

  static final _routeTheme = PullDownMenuRouteTheme(backgroundColor: Colors.grey[850]);

  @override
  Widget build(BuildContext context) {
    return PullDownMenu(
        routeTheme: _routeTheme,
        items: [
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
                    'https://drive.google.com/file/d/1LMoymXk89WW9e-Std0ls1V64HswXJGoB/view',
                  ),
                  webOnlyWindowName: '_blank');
            },
            title: 'Resume',
            icon: Ionicons.document_outline,
          ),
        ],
      ),
    ]);
  }
}
