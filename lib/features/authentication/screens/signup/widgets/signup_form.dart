import 'package:apps/features/authentication/controllers/singup/signup_controller.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'terms_conditions.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// Name
          TextFormField(
            controller: controller.firstName,
            validator: (value) => Validator.validateEmptyText(Texts.firstName, value),
            decoration: const InputDecoration(labelText: Texts.firstName, prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),

          /// UserName
          TextFormField(
            controller: controller.lastName,
            validator: (value) => Validator.validateEmptyText(Texts.lastName, value),
            decoration: const InputDecoration(labelText: Texts.lastName, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(labelText: Texts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validateEmptyText(Texts.phoneNo, value),
            decoration: const InputDecoration(labelText: Texts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: Sizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
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
          const SizedBox(height: Sizes.spaceBtwInputFields),

          /// Terms & Conditions
          const TermsAndConditions(),
          const SizedBox(height: Sizes.spaceBtwSections),

          /// SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(Texts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
