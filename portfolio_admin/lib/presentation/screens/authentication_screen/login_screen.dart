

import 'package:flutter/material.dart' ;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocListener;
import 'package:portfolio_shared/validators/validate_email.dart';

import '../../state_manger/auth_cubit/auth_cubit.dart' show AuthCubit, AuthState;
import '../root_screen/root_screen.dart' show RootScreen;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  onLogin(BuildContext context, String email, String password) {
    if (formKey.currentState?.validate() == true) {
      AuthCubit.get(context).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Login'),
            Text(
              'Omar Elnemr\'s Porfolio Admin',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(success: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RootScreen()),
            );
          });
        },
        child: Form(
          key: formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: validateEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        validator: validatePassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: state.mapOrNull<VoidCallback?>(
                            error: (_) => () {
                                  onLogin(context, emailController.text,
                                      passwordController.text);
                                },
                            initial: (_) => () {
                                  onLogin(context, emailController.text,
                                      passwordController.text);
                                }),
                        child: state.maybeWhen(orElse: ()=>const Text("Login"),loading: ()=>const CircularProgressIndicator.adaptive()),
                      ),
                      state.maybeWhen<Widget>(orElse: ()=>const SizedBox.shrink(),error: (error)=>Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(error.message??"Something Went Wrong!"),
                      ))
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
