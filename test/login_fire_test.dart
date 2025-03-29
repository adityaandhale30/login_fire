import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_fire/login_fire.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('LoginFire Package Tests', () {
    test('Initialize Firebase with valid options', () async {
      await LoginFire.initializeFirebase(
        firebaseOptions: const FirebaseOptions(
          apiKey: 'fake_api_key',
          authDomain: 'fake_auth_domain',
          projectId: 'fake_project_id',
          storageBucket: 'fake_storage_bucket',
          messagingSenderId: 'fake_messaging_sender_id',
          appId: 'fake_app_id',
        ),
      );

      expect(Firebase.apps.isNotEmpty, isTrue);
    });

    test('Firebase Initialization Failure', () async {
      try {
        await LoginFire.initializeFirebase(
          firebaseOptions: FirebaseOptions(
            apiKey: '',
            authDomain: '',
            projectId: '',
            storageBucket: '',
            messagingSenderId: '',
            appId: '',
          ),
        );
        fail("Firebase initialization should fail with empty options");
      } catch (e) {
        expect(e, isA<FirebaseException>());
      }
    });
  });
}
