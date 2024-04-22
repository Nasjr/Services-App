import 'package:ecommerce_application/features/authentication/Onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MDeviceUtils.getAppBarHeight().h,
        right: MSizes.defaultSpace.w,
        child: TextButton(
          onPressed: OnBoardingController.instance.skipPage,
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.green),
          ),
        ));
  }
}
