import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FavouritIconWidget extends StatelessWidget {
  const FavouritIconWidget({
    super.key,
    this.radius = 100,
    this.width,
    this.height,
    this.size = MSizes.lg,
    this.onPressed,
    this.iconColor,
  });

  final double radius;
  final double? width;
  final double? height;
  final double? size;
  final VoidCallback? onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final bool dark = MHelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.w),
          color: dark
              ? MColors.black.withOpacity(0.9)
              : MColors.white.withOpacity(0.9)),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.heart5,
            color: iconColor,
            size: size,
          )),
    );
  }
}
