import 'package:ecommerce_application/features/Home/View/Widgets/MainPage.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/View/SubCategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/CustomWhiteContainer/CustomWhiteContainer.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({
    super.key,
    this.height,
    required this.imageWidth,
    required this.width,
    required this.categoriesList,
  });
  final double? height;
  final double imageWidth;
  final double width;
  final List categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      alignment: Alignment.center,
      height: 220.0.h,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.to(
                () => SubCategoriesPage(title: categoriesList[index].name)),
            child: CustomWhiteContainer(
              title: categoriesList[index].name,
              imageCategoryPath: categoriesList[index].imageUrl,
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.h,
          mainAxisSpacing: 15.h,
        ),
      ),
    );
  }
}
