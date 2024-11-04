import 'package:apps/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:apps/utils/constants/image_strings.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// OnBoarding Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.onBoardingImage1, title: Texts.onBoardingTitle1, subTitle: Texts.onBoardingSubTitle1),
              OnBoardingPage(image: TImages.onBoardingImage2, title: Texts.onBoardingTitle2, subTitle: Texts.onBoardingSubTitle2),
              OnBoardingPage(image: TImages.onBoardingImage3, title: Texts.onBoardingTitle3, subTitle: Texts.onBoardingSubTitle3),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation
          const OnBoardingDotNavigation(),

          /// NextButton
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
