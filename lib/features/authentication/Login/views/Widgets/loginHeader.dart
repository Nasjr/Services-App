import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          MImages.mNAppLogo,
          height: 80.w,
        ),
        Text(
          MTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: MSizes.sm.h,
        ),
        Text(
          MTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
