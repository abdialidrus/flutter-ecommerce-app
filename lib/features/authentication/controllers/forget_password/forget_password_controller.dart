import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_ecommerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final emailTec = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset password email
  sendPasswordResetEmail() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loaderAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(emailTec.text.trim());

      // Remove loading
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: emailTec.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.loaderAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loading
      TFullScreenLoader.stopLoading();

      // Show success screen
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
