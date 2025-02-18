import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB25dSZA_l2NmL-qWx2NayrJPasN9T7qBY",
            authDomain: "app100-a0b68.firebaseapp.com",
            projectId: "app100-a0b68",
            storageBucket: "app100-a0b68.appspot.com",
            messagingSenderId: "804315189220",
            appId: "1:804315189220:web:64db79482553d30b9001f1",
            measurementId: "G-QK4EGQE3YD"));
  } else {
    await Firebase.initializeApp();
  }
}
