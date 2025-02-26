
import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart' show ExceptionImpl;
import 'package:portfolio_shared/domain/remote_source/database/firebase/auth.dart' show Auth;

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());
 static AuthCubit get(BuildContext context)=>BlocProvider.of(context);
  login(String email, String password) async {
      emit(const AuthState.loading());
     try {
       await Auth().loginWithEmailAndPassword(email, password);
       emit(const AuthState.success());
     } on ExceptionImpl catch(e){
       emit(AuthState.error(e));
     }
  }
}
