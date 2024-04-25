import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MRoundedImageWidget extends StatelessWidget {
  const MRoundedImageWidget({
    super.key,
    this.width = 250,
    this.height = 300,
    required this.imageUrl,
    this.applyRadius = true,
    this.isNetworkImage = true,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.grey,
    this.onPressed,
    this.border,
    this.padding,
    this.borderRadius = MSizes.lg,
  });
  final double? width, height;
  final double borderRadius;

  final String imageUrl;
  final bool applyRadius;
  final bool isNetworkImage;
  final BoxFit? fit;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ClipRRect(
          borderRadius: applyRadius
              ? BorderRadius.circular(borderRadius.w)
              : BorderRadius.zero,
          child: Image(
            height: height,
            width: width,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: BoxFit.contain,
          )),
    );
  }
}
