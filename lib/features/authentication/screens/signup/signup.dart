import 'package:apps/common/widgets/login_singup/form_divider.dart';
import 'package:apps/common/widgets/login_singup/social_buttons.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(Texts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Form
              const SignUpForm(),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Divider
              FormDivider(dividerText: Texts.orSignUpWith.toUpperCase()),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Social Buttons
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
