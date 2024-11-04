import 'package:apps/common/widgets/success_screen/success_screen.dart';
import 'package:apps/features/authentication/screens/login/login.dart';
import 'package:apps/utils/constants/image_strings.dart';
import 'package:apps/utils/constants/sizes.dart';
import 'package:apps/utils/constants/text_strings.dart';
import 'package:apps/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: HelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Title
              Text(Texts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text('joaovictorkerber@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwItems),
              Text(Texts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: Sizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: TImages.staticSuccessIllustration,
                        title: Texts.yourAccountCreatedTitle,
                        subTitle: Texts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                  child: const Text(Texts.tContinue),
                ),
              ),
              const SizedBox(height: Sizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(Texts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
