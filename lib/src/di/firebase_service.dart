import 'package:firebase_core/firebase_core.dart';
import 'package:nr_soporte_mobile/firebase_options.dart';

class FirebaseService {

  static Future<FirebaseService> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

    return FirebaseService();
  }
}