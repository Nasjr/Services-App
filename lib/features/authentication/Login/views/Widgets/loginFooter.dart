import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), border: Border.all()),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  MImages.google,
                  width: MSizes.iconLg,
                  height: MSizes.iconLg,
                ))),
        const SizedBox(
          width: MSizes.spaceBtwItems,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), border: Border.all()),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  MImages.facebook,
                  width: MSizes.iconLg,
                  height: MSizes.iconLg,
                ))),
        const SizedBox(
          width: MSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
