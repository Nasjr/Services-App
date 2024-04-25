import 'package:ecommerce_application/common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import 'package:ecommerce_application/features/AllServices/View/AllServices.dart';
import 'package:ecommerce_application/features/Home/View/Widgets/CustomGridHome/CustomGridviewHome.dart';
import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';

import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/CustomCarousel/CustomCarousel.dart';
import '../../../../common/widgets/CustomHeader/CustomHeader.dart';

import '../../Controller/HomeScreenController.dart';
import '../../Controller/MainScreenController.dart';
import '../NavigationView.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isArabic =
        AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar';
    return ListView(
      shrinkWrap: true,
      children: [
        CustomMainHeader(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<MainScreenController>(
              id: 'CrouselBuilder',
              builder: (contr) {
                return contr.isLoading == true
                    ? CircularProgressIndicator()
                    : CustomCarousel(
                        onPageChanged: (index, _) => contr.onPageChanged(index),
                        banners: contr.bannersList,
                        currentIndex: contr.currIndex);
              }),
        ),
        GetBuilder<HomeScreenController>(builder: (ctx) {
          return SectionRowHeader1(
            onTap: () => ctx.onDestenationSelected(1),
          );
        }),
        GetBuilder<MainScreenController>(builder: (ctx) {
          return ctx.isLoading == true
              ? CircularProgressIndicator()
              : GridViewHome(
                  imageWidth: 20.w,
                  width: 145.h,
                  categoriesList: ctx.featuredCategories);
        }),
        GetBuilder<HomeScreenController>(builder: (ctx) {
          return SectionRowHeader2(
            onTap: () => Get.to(() => AllServices()),
          );
        }),
        GetBuilder<MainScreenController>(builder: (ctrx) {
          return ctrx.isLoading == true
              ? CircularProgressIndicator()
              : HorizontalListViewWrapContainer(
                  itemBuilder: (context, index) {
                    return GetBuilder<MainScreenController>(builder: (context) {
                      return GestureDetector(
                        onTap: () => Get.to(() => ServiceProviderPage(
                            servicePorvider: ctrx.featuredServices[index])),
                        child: CustomCategory(
                            index: index,
                            categoryName: isArabic
                                ? ctrx.featuredServices[index].nameAR
                                : ctrx.featuredServices[index].name,
                            imageCategoryPath:
                                ctrx.featuredServices[index].imageUrl),
                      );
                    });
                  },
                  listLength: ctrx.featuredServices.length,
                );
        }),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
