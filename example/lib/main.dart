import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_fire/login_fire.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LoginFire.initializeFirebase(
    firebaseOptions: FirebaseOptions(
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final config = LoginFireConfig(
    appName: "My Modern App",
    onSuccess: () => print('Login Successful'),
    onError: (error) => print('Login Failed: $error'),
    lightTheme: LoginFireThemeConfig(
      backgroundColor: Colors.white,
      backgroundImage: 'assets/bg_light.png',
      headerImage: 'assets/header_light.png',
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 32),
      buttonTextStyle: TextStyle(color: Colors.white),
      inputTextStyle: TextStyle(color: Colors.black),
      hintTextStyle: TextStyle(color: Colors.grey),
      errorMessageStyle: TextStyle(color: Colors.red),
      successMessageStyle: TextStyle(color: Colors.green),
      forgotPasswordTextStyle: TextStyle(color: Colors.blue),
    ),
    darkTheme: LoginFireThemeConfig(
      backgroundColor: Colors.black,
      backgroundImage: 'assets/bg_dark.png',
      headerImage: 'assets/header_dark.png',
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 32),
      buttonTextStyle: TextStyle(color: Colors.black),
      inputTextStyle: TextStyle(color: Colors.white),
      hintTextStyle: TextStyle(color: Colors.white70),
      errorMessageStyle: TextStyle(color: Colors.redAccent),
      successMessageStyle: TextStyle(color: Colors.greenAccent),
      forgotPasswordTextStyle: TextStyle(color: Colors.tealAccent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginFire.buildLoginPage(config: config));
  }
}
