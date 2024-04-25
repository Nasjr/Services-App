import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/helpers/helper_functions.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    required this.index,
    this.width = 160,
    this.height = 80,
    this.imageWidth = 100,
    this.imageHeight = 80,
    required this.categoryName,
    required this.imageCategoryPath,
    this.onTap,
    this.categoryNamePadding = const EdgeInsets.only(left: 5, right: 5),
    this.isNetworkImage = true,
  });
  final int index;
  final double width, height;
  final double imageWidth, imageHeight;
  final String categoryName;
  final String imageCategoryPath;
  final void Function()? onTap;
  final EdgeInsetsGeometry categoryNamePadding;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: MHelperFunctions.isDarkMode(context)
              ? MColors.darkerGrey
              : MColors.white,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                child: isNetworkImage
                    ? CachedNetworkImage(
                        imageUrl: imageCategoryPath,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            image: DecorationImage(
                              image: imageProvider,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    : Image.asset(
                        width: imageWidth,
                        alignment: Alignment.center,
                        imageCategoryPath,
                      ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: categoryNamePadding,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$categoryName',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
