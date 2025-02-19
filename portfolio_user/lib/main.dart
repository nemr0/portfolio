import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, MultiBlocProvider;
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtil, ScreenUtilInit;
import 'package:flutter_web_plugins/flutter_web_plugins.dart' show usePathUrlStrategy;
import 'package:portfolio/presentation/routes/router.dart' show router;
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart' show GetProjectsCubit;
import 'package:portfolio_shared/extensions/context_extension.dart';
import 'package:portfolio_shared/init_user.dart' show initFirebaseForUser;

import 'core/const/colors.dart' show AppColors;
import 'core/const/font_settings.dart' show FontSettings;
import 'core/generated/fonts.gen.dart' show FontFamily;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  await initFirebaseForUser();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: context.screenUtilSize,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GetProjectsCubit()..getData(),lazy: false,),
          // BlocProvider(create: (_) => GetExperienceCubit()..getData(),lazy: false,),
        ],
        child: MaterialApp.router(

          routerConfig: router,

          debugShowCheckedModeBanner: false,
          title: 'Omar\'s Portfolio',
          theme: ThemeData(
              fontFamily: FontFamily.workSans,
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
              primaryColor: AppColors.primary,
              textTheme: FontSettings.textTheme(context),
              colorScheme: const ColorScheme.light(
                  primary: AppColors.primary, secondary: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}
