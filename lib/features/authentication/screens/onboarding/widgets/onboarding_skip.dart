import 'package:apps/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DeviceUtils.getAppBarHeight(),
      right: Sizes.defaultSpace,
      child: TextButton(onPressed: () => OnboardingController.instance.skipPage(), child: const Text(Texts.skip)),
    );
  }
}
