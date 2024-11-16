import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/main.dart';

final router = GoRoute(path: Routes.root,
    builder: (_,__)=>const MyHomePage(),
    routes: [GoRoute(path: Routes.highlightedProjects),]);