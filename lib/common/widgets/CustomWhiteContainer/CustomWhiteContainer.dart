import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWhiteContainer extends StatelessWidget {
  const CustomWhiteContainer({
    super.key,
    required this.title,
    required this.imageCategoryPath,
    this.isNetworkImage = true,
  });
  final String title;
  final String imageCategoryPath;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isNetworkImage
              ? CachedNetworkImage(
                  alignment: Alignment.center,
                  width: 40.w,
                  height: 30.w,
                  imageUrl: imageCategoryPath,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : ImageIcon(
                  AssetImage(imageCategoryPath),
                  size: 30.w,
                ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      width: 120.h,
      decoration: BoxDecoration(
          color: MHelperFunctions.isDarkMode(context)
              ? MColors.darkerGrey
              : MColors.white,
          borderRadius: BorderRadius.circular(10.w)),
    );
  }
}
