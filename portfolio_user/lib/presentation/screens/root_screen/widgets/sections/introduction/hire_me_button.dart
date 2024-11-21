import 'package:flutter/material.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';

class HireMeButton extends StatelessWidget {
  const HireMeButton({super.key});

  @override
  Widget build(BuildContext context) {

        return ShadowButton.text(
          text: 'HIRE ME',
          onPressed: () async {

          },
        );

  }
}
// return PullDownButtonInheritedTheme(
//   data: PullDownButtonTheme(
//       routeTheme: PullDownMenuRouteTheme(
//         backgroundColor: Colors.grey[850], // Dark background color
//       ),
//       itemTheme: PullDownMenuItemTheme(
//           textStyle: TextStyle(color: Colors.white,fontFamily: FontSettings.kFontWorkSans),
//           iconActionTextStyle: TextStyle(color: Colors.white,fontFamily: FontSettings.kFontWorkSans),
//           subtitleStyle: TextStyle(color: Colors.white54,fontFamily: FontSettings.kFontWorkSans),
//           onHoverBackgroundColor: AppColors.background,
//           onPressedBackgroundColor: AppColors.background,
//           onHoverTextColor: AppColors.textColor),
//       dividerTheme: PullDownMenuDividerTheme(
//         dividerColor: Colors.grey[700], // Divider color
//       ),
//       titleTheme: PullDownMenuTitleTheme(style: TextStyle(color: Colors.white,fontFamily: FontSettings.kFontWorkSans))),
//   child: Builder(builder: (context) {
//     return PullDownMenu( items: [
//       PullDownMenuTitle(
//           title: Center(
//               child: Text(
//                 'links',
//                 textAlign: TextAlign.center,
//               ))),
//       PullDownMenuActionsRow.medium(
//         items: [
//           PullDownMenuItem(
//             onTap: () {
//               launchUrl(
//                   Uri.parse(
//                     'https://github.com/nemr0',
//                   ),
//                   webOnlyWindowName: '_self');
//             },
//             title: 'Github',
//             icon: Ionicons.logo_github,
//           ),
//           PullDownMenuItem(
//             onTap: () {
//               launchUrl(
//                   Uri.parse(
//                     'https://www.linkedin.com/in/nemrdev/',
//                   ),
//                   webOnlyWindowName: '_self');
//             },
//             title: 'LinkedIn',
//             icon: Ionicons.logo_linkedin,
//           ),
//           PullDownMenuItem(
//             onTap: () {
//               launchUrl(
//                   Uri.parse(
//                     'https://dribbble.com/omarelnemr',
//                   ),
//                   webOnlyWindowName: '_self');
//             },
//             title: 'Dribbble',
//             icon: Ionicons.logo_dribbble,
//           ),
//         ],
//       ),
//       PullDownMenuActionsRow.medium(
//         items: [
//           PullDownMenuItem(
//             onTap: () {
//               launchUrl(
//                   Uri.parse(
//                     'https://www.tiktok.com/@nemrdev',
//                   ),
//                   webOnlyWindowName: '_self');
//             },
//             title: 'Tiktok',
//             icon: Ionicons.logo_tiktok,
//           ),
//           PullDownMenuItem(
//             onTap: () {
//               launchUrl(
//                   Uri.parse(
//                     'https://www.instagram.com/nemrdev/',
//                   ),
//                   webOnlyWindowName: '_self');
//             },
//             title: 'Instagram',
//             icon: Ionicons.logo_instagram,
//           ),
//         ],
//       ),
//     ],);
// }),
// );