import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = MColors.white,
    this.margin,
    this.gradient,
  });
  final int? width, height, radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: height?.h,
      margin: margin,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!.w),
          color: backgroundColor,
          gradient: gradient),
    );
  }
}
