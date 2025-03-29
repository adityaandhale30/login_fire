// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:login_fire/login_fire.dart';
// import 'package:login_fire/src/models/login_fire_config.dart';

// void main() {
//   group('LoginFire Tests', () {
//     const config = LoginFireConfig(
//       appName: "Test App",
//       onSuccess: () => print("Login Successful"),
//       onError: (error) => print("Login Error: $error"),
//       lightTheme: LoginFireThemeConfig(
//         backgroundColor: Colors.white,
//         titleTextStyle: TextStyle(fontSize: 28, color: Colors.black),
//         buttonTextStyle: TextStyle(fontSize: 18, color: Colors.white),
//         inputTextStyle: TextStyle(fontSize: 16),
//         hintTextStyle: TextStyle(color: Colors.grey),
//         errorMessageStyle: TextStyle(color: Colors.red),
//         successMessageStyle: TextStyle(color: Colors.green),
//         forgotPasswordTextStyle: TextStyle(color: Colors.blue),
//       ),
//       darkTheme: LoginFireThemeConfig(
//         backgroundColor: Colors.black,
//         titleTextStyle: TextStyle(fontSize: 28, color: Colors.white),
//         buttonTextStyle: TextStyle(fontSize: 18, color: Colors.black),
//         inputTextStyle: TextStyle(fontSize: 16, color: Colors.white),
//         hintTextStyle: TextStyle(color: Colors.white70),
//         errorMessageStyle: TextStyle(color: Colors.redAccent),
//         successMessageStyle: TextStyle(color: Colors.greenAccent),
//         forgotPasswordTextStyle: TextStyle(color: Colors.tealAccent),
//       ),
//     );

//     testWidgets('Login Page UI Test with Customization', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: LoginFire.buildLoginPage(config: config),
//       ));

//       // Check if app name is displayed
//       expect(find.text(config.appName), findsOneWidget);

//       // Check if text fields are rendered
//       expect(find.byType(TextField), findsNWidgets(2));

//       // Check if login button is rendered
//       expect(find.byType(ElevatedButton), findsOneWidget);
//     });

//     testWidgets('Login Error Handling Test', (WidgetTester tester) async {
//       bool errorHandled = false;

//       final errorConfig = config.copyWith(
//         onError: (error) {
//           expect(error, isNotEmpty);
//           errorHandled = true;
//         },
//       );

//       await tester.pumpWidget(MaterialApp(
//         home: LoginFire.buildLoginPage(config: errorConfig),
//       ));

//       await tester.enterText(find.byType(TextField).at(0), 'wrong@example.com');
//       await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');
//       await tester.tap(find.byType(ElevatedButton));

//       await tester.pump();
//       expect(errorHandled, true);
//     });

//     testWidgets('Login Success Test', (WidgetTester tester) async {
//       bool successHandled = false;

//       final successConfig = config.copyWith(
//         onSuccess: () {
//           successHandled = true;
//         },
//       );

//       await tester.pumpWidget(MaterialApp(
//         home: LoginFire.buildLoginPage(config: successConfig),
//       ));

//       await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
//       await tester.enterText(find.byType(TextField).at(1), 'password123');
//       await tester.tap(find.byType(ElevatedButton));

//       await tester.pump();
//       expect(successHandled, true);
//     });

//     testWidgets('Dark Mode Test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         themeMode: ThemeMode.dark,
//         darkTheme: ThemeData.dark(),
//         home: LoginFire.buildLoginPage(config: config),
//       ));

//       expect(find.text(config.appName), findsOneWidget);

//       // Check if UI applies dark mode text style
//       final textWidget = tester.widget<Text>(find.text(config.appName));
//       expect(textWidget.style?.color, Colors.white);
//     });

//     testWidgets('Button Customization Test', (WidgetTester tester) async {
//       const customTheme = LoginFireThemeConfig(
//         backgroundColor: Colors.blue,
//         titleTextStyle: TextStyle(fontSize: 28, color: Colors.white),
//         buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),
//         inputTextStyle: TextStyle(fontSize: 16, color: Colors.white),
//         hintTextStyle: TextStyle(color: Colors.white70),
//         errorMessageStyle: TextStyle(color: Colors.redAccent),
//         successMessageStyle: TextStyle(color: Colors.greenAccent),
//         forgotPasswordTextStyle: TextStyle(color: Colors.tealAccent),
//       );

//       await tester.pumpWidget(MaterialApp(
//         home: LoginFire.buildLoginPage(
//           config: config.copyWith(lightTheme: customTheme),
//         ),
//       ));

//       final buttonText = tester.widget<Text>(find.descendant(
//         of: find.byType(ElevatedButton),
//         matching: find.byType(Text),
//       ));

//       expect(buttonText.style?.fontSize, 20);
//       expect(buttonText.style?.color, Colors.white);
//     });
//   });
// }
