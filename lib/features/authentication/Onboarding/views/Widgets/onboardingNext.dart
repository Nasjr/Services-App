import 'package:ecommerce_application/features/authentication/Onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
        right: MSizes.defaultSpace.w,
        bottom: MDeviceUtils.getBottomNavigationBarHeight() / 1.5.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? MColors.primary : Colors.green),
            onPressed: OnBoardingController.instance.nextPage,
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
