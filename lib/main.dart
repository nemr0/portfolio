import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/const/colors.dart';
import 'package:portfolio/core/const/resource.dart';
import 'package:portfolio/core/extensions/context_extension.dart';


Future<void> main() async {
   ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: context.screenUtilSize,
      builder:(_,child)=> MaterialApp.router(
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBackground,
            primaryColor: AppColors.primary,
            colorScheme: const ColorScheme.light(
                primary: AppColors.primary, secondary: AppColors.secondary)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.background,
          image: DecorationImage(
              repeat: ImageRepeat.repeat,
              scale: 4,
              opacity: .75,
              image: AssetImage(AppAssets.ASSETS_WEBP_BACKGROUND_PATTERN_WEBP,))),

    );
  }
}
