import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/routes/hero_page/hero_page.dart';
import 'package:portfolio/presentation/screens/root_screen/root_screen.dart';
import 'package:portfolio/presentation/screens/root_screen/widgets/bottom_sheets/projects_pageview_bottom_sheet.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//     routes: [
//       GoRoute(path: Routes.root,
//         builder: (_,__)=>const RootScreen(),
//         routes: [GoRoute(path: Routes.highlightedProjects,routes: [
//
//         ])]
//       ),
//     ],);

// final ValueNotifier<RoutingConfig> myRoutingConfig =
//     ValueNotifier<RoutingConfig>(
//   RoutingConfig(
//     routes: <RouteBase>[
//
//     ],
//   ),
// );
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: Routes.root,
        builder: (_, state)
        {
        return  RootScreen(initBackgroundColor: state.pathParameters.isEmpty  ? AppColors.background : AppColors
              .primary,);
        },     routes: [
          GoRoute(
            path: Routes.highlightedProjectsWithId,
            name: Routes.highlightedProjects,
            pageBuilder: (_, state) => HeroPage(
              builder: (_) => ProjectsPageViewBottomSheet(
                projectId: state.pathParameters[Routes.highlightedProjectsId] ?? '',
              ),
            ),


          )
        ]),
  ],
  observers: [routeObserver],
);
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

// addRouterConfigFromProjects(List<Project> projects) {
//   var existingRoutes =
//       myRoutingConfig.value.routes.first.routes.first.routes.where((e) {
//     return e.toString().contains(Routes.highlightedProjects) == false;
//   });
//   print(existingRoutes);
//   myRoutingConfig.value = RoutingConfig(routes: [
//     GoRoute(path: Routes.root, builder: (_, __) => const RootScreen(), routes: [
//
//     ]),
//   ]);

// = RoutingConfig(
//   routes: <RouteBase>[
//     GoRoute(
//         path: Routes.root,
//         builder: (_, __) => const RootScreen(),
//         routes: [GoRoute(path: Routes.highlightedProjects, routes: [])]),
//   ],
// );
// }
