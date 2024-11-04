import 'package:apps/data/services/authentication_service.dart';
import 'package:apps/features/authentication/models/user_model.dart';
import 'package:apps/features/home/home.dart';
import 'package:apps/utils/constants/image_strings.dart';
import 'package:apps/utils/helpers/network_manager.dart';
import 'package:apps/utils/popups/full_screen_loader.dart';
import 'package:apps/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final AuthenticationService _authService = AuthenticationService();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;

  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Prepare data
      final newUser = UserModel(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        email: email.text.trim(),
        password: password.text,
      );
      final data = newUser.toJson();

      // Call Service
      await _authService.register(data);

      // Navigate to the next screen or home
      Get.offAll(() => const HomeScreen());

      TLoaders.successSnackBar(title: 'Success', message: 'Successfully registered');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Registration Failed', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
