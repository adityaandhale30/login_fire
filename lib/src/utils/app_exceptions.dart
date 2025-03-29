import 'package:firebase_auth/firebase_auth.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;

  // Handle Firebase Authentication Errors
  factory AppException.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return AppException('No user found with this email.');
      case 'wrong-password':
        return AppException('Incorrect password. Please try again.');
      case 'email-already-in-use':
        return AppException('This email is already registered.');
      case 'invalid-email':
        return AppException('Invalid email format.');
      default:
        return AppException('An unexpected error occurred: ${e.message}');
    }
  }
}
