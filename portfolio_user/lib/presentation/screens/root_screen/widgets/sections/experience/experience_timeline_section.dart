// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:portfolio/core/const/colors.dart';
// import 'package:portfolio/core/const/font_settings.dart';
// import 'package:portfolio_shared/data/models/experience/experience.dart';
// // import 'package:timelines_plus/timelines_plus.dart';
//
// class ExperienceTimelineSection extends StatefulWidget {
//   const ExperienceTimelineSection({super.key});
//
//   @override
//   State<ExperienceTimelineSection> createState() =>
//       _ExperienceTimelineSectionState();
// }
//
// class _ExperienceTimelineSectionState extends State<ExperienceTimelineSection> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: ExperienceTimeline(experienceItems: [ExperienceItem(from: 'from', to: 'to', company: 'company', jobTitle: 'jobTitle'),ExperienceItem(from: 'from', to: 'to', company: 'company', jobTitle: 'jobTitle'),],),
//     );
//   }
// }
// class ExperienceTimeline extends StatelessWidget {
//   const ExperienceTimeline({super.key, required this.experienceItems});
//   final List<ExperienceItem> experienceItems;
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Timeline.tileBuilder(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           theme: TimelineThemeData(
//             nodeItemOverlap: true,
//             nodePosition: 0,
//             color: Colors.grey.shade400,
//           ),
//           builder: TimelineTileBuilder.connected(
//             connectionDirection: ConnectionDirection.before,
//             contentsAlign: ContentsAlign.basic,
//
//             connectorBuilder: (_, index, __) => SolidLineConnector(
//               color: AppColors.textColor,
//             ),
//             indicatorBuilder: (_, index) => DotIndicator(
//               color: AppColors.primary,
//               border: Border.all(color: AppColors.textColor),
//             ),
//             itemCount: 2,
//             contentsBuilder: (context, index) {
//
//
//               return Padding(
//                 padding: const EdgeInsets.only(left: 8.0, bottom: 24.0),
//                 child: ExperienceTile(
//                   title: experienceItems[index].company,
//                   subtitle: experienceItems[index].jobTitle,
//                   date: '${experienceItems[index].from} - ${experienceItems[index].from}',
//                 ),
//               );
//             },
//           ),
//         ),
//       );
//   }
// }
//
// class ExperienceTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String date;
//
//   const ExperienceTile({super.key,
//     required this.title,
//     required this.subtitle,
//     required this.date,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 280.spMax,
//       height: 103.spMax,
//       child: Card(
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: RichText(text: TextSpan(
//               children: [
//                 TextSpan(text: title,style: Theme.of(context).textTheme.labelLarge),
//                 TextSpan(text: '\n',style: Theme.of(context).textTheme.labelLarge),
//                 TextSpan(text: subtitle,style: Theme.of(context).textTheme.labelMedium),
//                 TextSpan(text: '\n',style: Theme.of(context).textTheme.labelLarge),
//                 TextSpan(text: date,style: Theme.of(context).textTheme.labelSmall),
//
//               ],
//             )),
//           )
//         ),
//       ),
//     );
//   }
// }
