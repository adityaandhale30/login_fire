library;

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_fire/src/models/login_fire_config.dart';
import 'package:login_fire/src/views/login_page.dart';

class LoginFire {
  // Firebase Initialization
  static Future<void> initializeFirebase({
    required FirebaseOptions firebaseOptions,
  }) async {
    await Firebase.initializeApp(options: firebaseOptions);
  }

  // Build Login Page using LoginFireConfig
  static Widget buildLoginPage({required LoginFireConfig config}) {
    return LoginPage(config: config);
  }
}
