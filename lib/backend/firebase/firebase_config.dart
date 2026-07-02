import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNWb4nMRCWl_eugeK93kucm1tfc_ICkuM",
            authDomain: "instasharefinal-frtyuc.firebaseapp.com",
            projectId: "instasharefinal-frtyuc",
            storageBucket: "instasharefinal-frtyuc.firebasestorage.app",
            messagingSenderId: "431861118983",
            appId: "1:431861118983:web:fc11b5707c2eb6d1c652a2"));
  } else {
    await Firebase.initializeApp();
  }
}
