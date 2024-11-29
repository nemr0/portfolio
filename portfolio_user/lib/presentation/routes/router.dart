import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/screens/root_screen/root_screen.dart';
import 'package:portfolio_shared/data/models/project/project.dart';

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

final ValueNotifier<RoutingConfig> myRoutingConfig =
    ValueNotifier<RoutingConfig>(
  RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
          path: Routes.root,
          builder: (_, __) => const RootScreen(),
          routes: [GoRoute(path: Routes.highlightedProjects, routes: [])]),
    ],
  ),
);
final GoRouter router = GoRouter.routingConfig(routingConfig: myRoutingConfig);

createRouterConfigFromProjects(List<Project> projects){
  var existingRouter= myRoutingConfig.value.routes.first.routes.where((e){
  return  e.toString().contains(Routes.highlightedProjects)==false;
  });
  myRoutingConfig.value=RoutingConfig(routes: [

  ]);

  /*= RoutingConfig(
    routes: <RouteBase>[
      GoRoute(
          path: Routes.root,
          builder: (_, __) => const RootScreen(),
          routes: [GoRoute(path: Routes.highlightedProjects, routes: [])]),
    ],
  );*/
}