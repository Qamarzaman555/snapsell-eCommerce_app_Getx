import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final localStorage = GetStorage();
  final hidePassword = true.obs; // Obersever for hiding/showing password
  final passwordPrefixIcontoggle =
      true.obs; // Obersever for hiding/showing password
  final rememberMe = false.obs; // Observer for storing login info
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// -- Email and Password Sign
  void emailAndPasswordSignIn() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'Logging you in...', AppImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        AppFullScreenLoader.stopLoading();
      } else {
        // Form Validation
        if (loginFormKey.currentState!.validate()) {
          // Save Data if Remember Me is Selected
          if (rememberMe.value) {
            localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
            localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
          }

          // Login user using Email & Password Authentication.
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
              email.text.trim(), password.text.trim());

          // Remove Loader
          AppFullScreenLoader.stopLoading();

          // Redirect
          AuthenticationRepository.instance.screenRedirect();
        } else {
          // Form is not valid so return to sign up
          // Remove Loader
          AppFullScreenLoader.stopLoading();
        }
      }
    } catch (e) {
      // Remove Loader
      AppFullScreenLoader.stopLoading();

      // Show Some Generic Error to the User
      AppLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }
}
