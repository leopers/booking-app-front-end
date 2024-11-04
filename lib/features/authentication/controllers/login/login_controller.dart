import 'package:apps/data/services/authentication_service.dart';
import 'package:apps/utils/constants/image_strings.dart';
import 'package:apps/utils/helpers/network_manager.dart';
import 'package:apps/utils/popups/full_screen_loader.dart';
import 'package:apps/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final AuthenticationService _authService = AuthenticationService();

  final localStorage = GetStorage();

  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> login() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!loginFormKey.currentState!.validate()) return;

      // Save data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Prepare data
      final data = {
        'email': email.text.trim(),
        'password': password.text,
      };

      // Call the service
      await _authService.login(data);

      // Redirect
      TLoaders.successSnackBar(title: 'Success', message: 'Successfully logged in');
      //AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
