import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

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
            width: MHelperFunctions.screenWidth() * 0.8,
            height: MHelperFunctions.screenWidth() * 0.8),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: MSizes.spaceBtwItems,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
