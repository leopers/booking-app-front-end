import 'package:apps/utils/constants/image_strings.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 150, image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo)),
        Text(Texts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: Sizes.sm),
        Text(Texts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
