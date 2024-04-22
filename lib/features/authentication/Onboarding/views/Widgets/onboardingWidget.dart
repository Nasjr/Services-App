import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
            image: AssetImage(image),
            width: MHelperFunctions.screenWidth() * 0.8.w,
            height: MHelperFunctions.screenWidth() * 0.8.h),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 22.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MSizes.spaceBtwItems.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
