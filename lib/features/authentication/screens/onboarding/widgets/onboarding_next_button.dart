import 'package:apps/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:apps/utils/constants/colors.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/device/device_utility.dart';
import 'package:apps/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      right: Sizes.defaultSpace,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? TColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3)),
    );
  }
}
