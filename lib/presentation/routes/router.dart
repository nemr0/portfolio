import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/routes/hero_page/hero_page.dart';
import 'package:portfolio/presentation/screens/not_found_screen/not_found_screen.dart';
import 'package:portfolio/presentation/screens/root_screen/root_screen.dart';
import 'package:portfolio/presentation/screens/projects_screen/projects_screen.dart';

final GoRouter router = GoRouter(
  errorPageBuilder: (_, __) => HeroPage(builder: (BuildContext context) => const NotFoundScreen()),
  routes: [
    GoRoute(
      path: Routes.root,
      builder: (_, state) {
        return RootScreen(
          initBackgroundColor:
              state.pathParameters.isEmpty ? AppColors.background : AppColors.primary,
        );
      },
      routes: [
        GoRoute(
          path: Routes.highlightedProjectsWithId,
          name: Routes.highlightedProjects,
          pageBuilder: (_, state) => HeroPage(
                builder: (_) => ProjectsScreen(
                      projectId: state.pathParameters[Routes.highlightedProjectsId] ?? '',
                    ),
              ),
        ),
      ],
    ),
  ],
  observers: [routeObserver],
);
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
