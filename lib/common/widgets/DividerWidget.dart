import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.dividerText,
  });

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? MColors.darkGrey : MColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(dividerText),
        Flexible(
          child: Divider(
            color: dark ? MColors.darkGrey : MColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
