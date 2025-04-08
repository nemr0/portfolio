import 'package:flutter/material.dart';
import 'package:portfolio/presentation/shared_widgets/shadow_button.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {

        return ShadowButton.text(
          text: 'CONTACT ME',
          onPressed: onPressed,
          // onPressed: () async {
          //   launchUrl(Uri.parse("https://api.whatsapp.com/send?phone=201147898061&text=Hey%20Omar%20%F0%9F%91%8B%2C%0AI%20need%20to%20contact%20you%20ASAP%20about%3A"));
          // },
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