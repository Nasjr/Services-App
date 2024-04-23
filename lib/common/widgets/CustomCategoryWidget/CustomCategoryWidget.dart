import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/helpers/helper_functions.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    required this.index,
    this.width = 120,
    this.height = 140,
    this.imageWidth = 90,
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
        decoration: BoxDecoration(
            color: MHelperFunctions.isDarkMode(context)
                ? Color.fromARGB(255, 80, 79, 79)
                : const Color.fromARGB(255, 214, 212, 212),
            borderRadius: BorderRadius.circular(20.w)),
        height: height.h,
        width: width.w,
        child: Stack(
          children: [
            ClipRRect(
              child: isNetworkImage
                  ? CachedNetworkImage(
                      imageUrl: imageCategoryPath,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitWidth,
                              colorFilter: ColorFilter.mode(
                                  Colors.red, BlendMode.colorBurn)),
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
                      fit: BoxFit.fitWidth,
                    ),
            ),
            Padding(
              padding: categoryNamePadding,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$categoryName',
                  style: TextStyle(
                      color: Color.fromARGB(225, 255, 255, 255),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
