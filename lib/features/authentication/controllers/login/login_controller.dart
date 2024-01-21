import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/image_strings.dart';
import 'package:flutter_ecommerce_app/utils/helpers/network_manager.dart';
import 'package:flutter_ecommerce_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final emailTec = TextEditingController();
  final passwordTec = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onReady() {
    super.onReady();
    emailTec.text = localStorage.read('REMEMBER_ME_EMAIL');
    //passwordTec.text = localStorage.read('REMEMBER_ME_PASSWORD');
  }

  /// Email and Password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Loggin you in...', TImages.loaderAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailTec.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', passwordTec.text.trim());
      }

      // Login user using Email & Password authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(emailTec.text.trim(), passwordTec.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Loggin you in...', TImages.loaderAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
