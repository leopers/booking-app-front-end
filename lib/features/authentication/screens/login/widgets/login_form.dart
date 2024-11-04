import 'package:apps/features/authentication/controllers/login/login_controller.dart';
import 'package:apps/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:apps/features/authentication/screens/signup/signup.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => Validator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: Texts.email),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => Validator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: Texts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                    ),
                  ),
                  const Text(Texts.rememberMe),
                ]),

                /// Forget Password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(Texts.forgetPassword)),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            /// Sign In
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.login(), child: const Text(Texts.signIn)),
            ),
            const SizedBox(height: Sizes.spaceBtwItems),

            /// Create Account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(Texts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
