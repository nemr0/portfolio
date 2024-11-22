import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_admin/presentation/const/colors.dart';
import 'package:portfolio_admin/presentation/root_screen/root_screen.dart';
import 'package:portfolio_admin/presentation/state_manger/upload_cover_cubit/upload_cover_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>UploadCoverCubit()),
      ],
      child: MaterialApp(
        title: 'Portfolio Admin',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          primaryColor: AppColors.primary,
          colorScheme: const ColorScheme.dark(
              primary: AppColors.primary, secondary: AppColors.secondary),
          useMaterial3: true,
        ),
        home: const RootScreen(),
      ),
    );
  }
}
