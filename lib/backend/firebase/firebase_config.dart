import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyClVZ7GowzFTVgsRYi2ZP80_cs_YZySY0w",
            authDomain: "carteirapalito-zveeap.firebaseapp.com",
            projectId: "carteirapalito-zveeap",
            storageBucket: "carteirapalito-zveeap.appspot.com",
            messagingSenderId: "875415812843",
            appId: "1:875415812843:web:784c75c1c68d757eefdcae"));
  } else {
    await Firebase.initializeApp();
  }
}
