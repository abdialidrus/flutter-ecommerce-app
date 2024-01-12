import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_ecommerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final checkPrivacyPolicy = false.obs;

  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Rx<bool> isLoading = false.obs;

  /// -- SIGNUP
  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.loaderAnimation);

      // Check the internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy policy
      if (!checkPrivacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Privacy Policy is not accepted',
          message:
              'In order to create an account, you must read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase Aunthentication & Save the user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show success message

      // Move to Verify Email screen
    } catch (e) {
      // Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
