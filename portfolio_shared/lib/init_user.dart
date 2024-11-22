import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_shared/firebase_options.dart';

initFirebaseForUser() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}