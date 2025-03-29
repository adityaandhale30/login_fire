import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_fire/src/services/firebase_service.dart';

class AuthController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = _firebaseService.currentUser;
  }

  // Sign In
  Future<void> signInWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final credential = await _firebaseService.signInWithEmail(
        email,
        password,
      );
      user.value = credential.user;
      errorMessage.value = '';
      Get.snackbar('Success', 'Login Successful');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Up
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      final credential = await _firebaseService.signUpWithEmail(
        email,
        password,
      );
      user.value = credential.user;
      errorMessage.value = '';
      Get.snackbar('Success', 'Account Created Successfully');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _firebaseService.signOut();
      user.value = null;
      Get.snackbar('Success', 'Signed Out Successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out: ${e.toString()}');
    }
  }
}
