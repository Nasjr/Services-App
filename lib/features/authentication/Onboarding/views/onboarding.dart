import 'package:ecommerce_application/features/authentication/Onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/Widgets/onboardingNext.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/Widgets/onboardingPageIndicator.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/Widgets/onboardingSkip.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/Widgets/onboardingWidget.dart';

import 'package:ecommerce_application/utils/constants/image_strings.dart';

import 'package:ecommerce_application/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: (index) =>
                onBoardingController.updatePageIndicator(index),
            children: const [
              OnboardingWidget(
                title: MTexts.onBoardingTitle1,
                subtitle: MTexts.onBoardingSubTitle1,
                image: MImages.onBoardingImage1,
              ),
              OnboardingWidget(
                title: MTexts.onBoardingTitle2,
                subtitle: MTexts.onBoardingSubTitle2,
                image: MImages.onBoardingImage2,
              ),
              OnboardingWidget(
                title: MTexts.onBoardingTitle3,
                subtitle: MTexts.onBoardingSubTitle3,
                image: MImages.onBoardingImage3,
              ),
            ],
          ),
          // Skip
          const OnboardingSkip(),
          // Dot Navigation SmoothPageIndicator
          const PageIndicator(),
          // Circular Button
          const NextButton()
        ],
      ),
    );
  }
}
