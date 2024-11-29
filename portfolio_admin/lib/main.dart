import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_admin/presentation/const/colors.dart';
import 'package:portfolio_admin/presentation/screens/authentication_screen/login_screen.dart';
import 'package:portfolio_admin/presentation/screens/root_screen/root_screen.dart';
import 'package:portfolio_admin/presentation/state_manger/auth_cubit/auth_cubit.dart';
import 'package:portfolio_shared/domain/remote_source/database/firebase/auth.dart';
import 'package:portfolio_shared/init_user.dart';

Future<void> main() async {
  await initFirebaseForUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),)
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
        home: Auth().currentUser == null
            ? const LoginScreen()
            : const RootScreen(),
      ),
    );
  }
}
