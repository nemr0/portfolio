import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio_shared/data/models/exceptions/server_error.dart';

class Auth{
  Auth._internal();
  static final Auth _instance =   Auth._internal();
  factory Auth(){
    return _instance;
  }
final auth = FirebaseAuth.instance;
loginWithEmailAndPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw ServerException(endpoint: 'login', stackTrace: e.stackTrace, error: e.code, message: e.message);

  }
}
User? get currentUser=>auth.currentUser;
}