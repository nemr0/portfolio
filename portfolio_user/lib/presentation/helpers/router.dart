import 'package:go_router/go_router.dart';
import 'package:portfolio/core/const/routes.dart';
import 'package:portfolio/presentation/screens/root_screen/root_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
    routes: [
      GoRoute(path: Routes.root,
        builder: (_,__)=>const RootScreen(),),
    ],);