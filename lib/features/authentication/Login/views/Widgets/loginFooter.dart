import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MSizes.md.w,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                  width: 0,
                  color: dark ? MColors.white : MColors.primary,
                )),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  MImages.google,
                  width: MSizes.iconLg.w,
                  height: MSizes.iconLg.h,
                ))),
        const SizedBox(
          width: MSizes.spaceBtwItems,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                  width: 0,
                  color: dark ? MColors.white : MColors.primary,
                )),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  MImages.facebook,
                  width: MSizes.iconLg.w,
                  height: MSizes.iconLg.h,
                ))),
        SizedBox(
          width: MSizes.spaceBtwItems.w,
        ),
      ],
    );
  }
}
