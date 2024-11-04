import 'package:apps/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:apps/utils/constants/colors.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/device/device_utility.dart';
import 'package:apps/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight() + Sizes.defaultSpace,
      left: Sizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),
      ),
    );
  }
}
