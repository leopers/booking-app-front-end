import 'package:apps/features/authentication/controllers/singup/signup_controller.dart';
import 'package:apps/utils/constants/colors.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();
    final dark = HelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(text: '${Texts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${Texts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primary,
                      )),
              TextSpan(text: '${Texts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${Texts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary,
                    ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
