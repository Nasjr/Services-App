import 'package:ecommerce_application/common/widgets/FavouriteIcon.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/Home/View/Widgets/RoundedBanner/Roundedbanner.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical(
      {super.key,
      this.onTapProduct,
      this.onTapFav,
      required this.title,
      required this.imagePath});
  final Function()? onTapProduct;
  final Function()? onTapFav;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTapProduct,
      child: Container(
        width: 180.w,
        padding: EdgeInsets.all(0.w),
        decoration: BoxDecoration(
            color: dark ? MColors.darkerGrey : MColors.white,
            boxShadow: [MShadowClass.verticalProductShadow],
            borderRadius: BorderRadius.circular(MSizes.productImageRadius.w)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image with a stack
            MRoundedContainer(
              height: 120.h,
              padding: EdgeInsets.all(MSizes.sm.w),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  // Rounded Product Image
                  Container(
                    alignment: Alignment.center,
                    child: MRoundedImageWidget(
                      fit: BoxFit.fill,
                      backgroundColor: dark ? MColors.dark : MColors.light,
                      imageUrl: imagePath,
                      applyRadius: true,
                    ),
                  ),
                  // Fav Icon
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FavouritIconWidget(
                        onPressed: () => onTapFav,
                        iconColor: Colors.red,
                      )),
                ],
              ),
            ),

            // Details Column
            Padding(
              padding: EdgeInsets.only(left: MSizes.sm.w, top: 20.h),
              child: ProductTitleText(
                title: title,
                smallSize: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.currencySign = '\$',
    this.maxLines = 1,
    this.lineThrough = false,
    this.isLarge = false,
  });
  final String price, currencySign;
  final int? maxLines;
  final bool lineThrough;
  final bool isLarge;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$currencySign $price',
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}

class MRoundedContainer extends StatelessWidget {
  const MRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.child,
    this.margin,
    this.radius = MSizes.cardRadiusLg,
    this.showBorder = false,
    this.backgroundColor = MColors.white,
    this.borderColor = MColors.borderPrimary,
  });
  final double? width, height;
  final double radius;
  final bool showBorder;

  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: height?.h,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.w),
          border: showBorder ? Border.all(color: borderColor) : null,
          color: backgroundColor),
      child: child,
    );
  }
}

class MShadowClass {
  static final verticalProductShadow = BoxShadow(
    color: MColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 1),
  );

  static final horizontalProductShadow = BoxShadow(
    color: MColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}

class ProductTitleText extends StatelessWidget {
  const ProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = true,
      this.maxLines = 2,
      this.textAlign = TextAlign.left});
  final String title;
  final bool smallSize;
  final int? maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: smallSize
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
