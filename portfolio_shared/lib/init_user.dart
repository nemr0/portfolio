import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_shared/firebase_options.dart';

initUser() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}