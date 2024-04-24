import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import 'package:ecommerce_application/features/AllServices/View/AllServices.dart';
import 'package:ecommerce_application/features/Home/View/Widgets/CustomGridHome/CustomGridviewHome.dart';
import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';
import 'package:ecommerce_application/features/ServicesPage/View/ServicesPage.dart';
import 'package:ecommerce_application/features/Settings/View/Settings.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/CustomCarousel/CustomCarousel.dart';
import '../../../../common/widgets/CustomDropDown/CustomDropDown.dart';
import '../../../../common/widgets/CustomHeader/CustomHeader.dart';
import '../../../../common/widgets/CustomSearchWidget/CustomSearchWidget.dart';
import '../../../../common/widgets/NotificationWidget/NotificationWidget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../SubCategoriesPage/View/SubCategoriesPage.dart';
import '../../Controller/HomeScreenController.dart';
import '../../Controller/MainScreenController.dart';
import '../NavigationView.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CustomMainHeader(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<MainScreenController>(
              id: 'CrouselBuilder',
              builder: (contr) {
                return CustomCarousel(
                    onPageChanged: (index, _) => contr.onPageChanged(index),
                    banners: contr.banners,
                    currentIndex: contr.currIndex);
              }),
        ),
        GetBuilder<HomeScreenController>(builder: (ctx) {
          return SectionRowHeader1(
            onTap: () => ctx.onDestenationSelected(1),
          );
        }),
        GetBuilder<MainScreenController>(builder: (ctx) {
          return GridViewHome(
              imageWidth: 20.w, width: 145.h, categoriesList: ctx.categoryList);
        }),
        GetBuilder<HomeScreenController>(builder: (ctx) {
          return SectionRowHeader2(
            onTap: () => Get.to(() => AllServices()),
          );
        }),
        GetBuilder<MainScreenController>(builder: (ctrx) {
          return HorizontalListViewWrapContainer(
            itemBuilder: (context, index) {
              return GetBuilder<MainScreenController>(builder: (context) {
                return GestureDetector(
                  onTap: () => Get.to(() => ServiceProviderPage(
                      servicePorvider: ctrx.servicesList[index])),
                  child: CustomCategory(
                      isNetworkImage: false,
                      index: index,
                      categoryName: ctrx.servicesList[index].name,
                      imageCategoryPath: MImages.productImage1),
                );
              });
            },
            listLength: ctrx.servicesList.length,
          );
        }),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
