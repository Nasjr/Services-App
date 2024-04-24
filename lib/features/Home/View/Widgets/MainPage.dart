import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import 'package:ecommerce_application/features/AllServices/View/AllServices.dart';
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
import '../../../../common/widgets/CustomSearchWidget/CustomSearchWidget.dart';
import '../../../../common/widgets/NotificationWidget/NotificationWidget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../SubCategoriesPage/View/SubCategoriesPage.dart';
import '../../Controller/HomeScreenController.dart';
import '../../Controller/MainScreenController.dart';
import '../HomeScreen.dart';

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
        GetBuilder<MainScreenController>(
            id: 'CrouselBuilder',
            builder: (contr) {
              return CustomCarousel(
                  onPageChanged: (index, _) => contr.onPageChanged(index),
                  banners: contr.banners,
                  currentIndex: contr.currIndex);
            }),
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
          return HorizontalListView(servicesList: ctrx.servicesList);
        }),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}

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
      padding: EdgeInsets.all(5.w),
      alignment: Alignment.center,
      height: 220.0.h,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return CustomCategoryWIcon(
            title: categoriesList[index].name,
            imageCategoryPath: categoriesList[index].imageUrl,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.h,
          mainAxisSpacing: 20.h,
        ),
      ),
    );
  }
}

class CustomCategoryWIcon extends StatelessWidget {
  const CustomCategoryWIcon({
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
          color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
    );
  }
}

class CustomMainHeader extends StatelessWidget {
  const CustomMainHeader({
    super.key,
    this.isHomeScreen = true,
  });
  final bool isHomeScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: MHelperFunctions.isDarkMode(context)
                ? [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(255, 77, 77, 77),
                  ]
                : [
                    Color.fromARGB(255, 3, 136, 59),
                    Color.fromARGB(255, 4, 180, 92).withOpacity(0.9),
                  ],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w))),
      padding:
          EdgeInsets.only(top: 15.h, bottom: 10.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<MainScreenController>(builder: (cont) {
            return isHomeScreen
                ? Row(
                    children: [
                      CustomDropDown(
                          value: cont.currZone,
                          items: cont.zones.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                '$value',
                                style: TextStyle(
                                    fontSize: 10.sp, color: MColors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (zone) => cont.onZoneChanged(zone)),
                      const Spacer(),
                      NotificationsWidget(),
                      IconButton(
                        onPressed: () => Get.to(() => SettingsPage()),
                        icon: Icon(
                          Icons.settings,
                          size: 25.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          S.current.Settings,
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.sp),
                        )),
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: CircleAvatar(
                            radius: 40.w,
                            child: Image.asset(
                              MImages.user,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          'UserId: 34948456578346',
                          style: TextStyle(
                              color: MColors.light,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
          }),
          if (isHomeScreen) SearchWidget()
        ],
      ),
    );
  }
}
