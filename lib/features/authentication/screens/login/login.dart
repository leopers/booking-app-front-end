import 'package:apps/common/styles/spacing_styles.dart';
import 'package:apps/common/widgets/login_singup/form_divider.dart';
import 'package:apps/common/widgets/login_singup/social_buttons.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Header
              const LoginHeader(),

              /// Form
              const LoginForm(),

              /// Divider
              FormDivider(dividerText: Texts.orSignInWith.toUpperCase()),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
