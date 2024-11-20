import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/font_settings.dart';
import 'package:portfolio/core/extensions/context_extension.dart';
import 'package:portfolio/presentation/helpers/router.dart';
import 'package:portfolio/presentation/state_manager/get_experience_cubit/get_experience_cubit.dart';
import 'package:portfolio/presentation/state_manager/get_projects_cubit/get_projects_cubit.dart';
import 'package:portfolio_shared/init_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtil.ensureScreenSize();
  await initUser();
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
          BlocProvider(create: (_) => GetExperienceCubit()..getData(),lazy: false,),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: FontSettings.kFontWorkSans,
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
