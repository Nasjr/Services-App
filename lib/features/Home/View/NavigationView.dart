import 'package:ecommerce_application/common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import 'package:ecommerce_application/features/Home/Controller/HomeScreenController.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/features/Home/model/CategoryModel.dart';
import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../ServicesPage/Model/ServicesModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    Get.put(HomeScreenController());
    return SafeArea(
      child: GetBuilder<HomeScreenController>(builder: (ctx) {
        return WillPopScope(
          onWillPop: () {
            if (ctx.selectedBottomNavigationBarIndex != 0) {
              ctx.selectedBottomNavigationBarIndex = 0;
              ctx.changeCurrPage();
              ctx.update();
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: Scaffold(
              bottomNavigationBar: NavigationBar(
                destinations: [
                  NavigationDestination(
                      icon: Icon(Iconsax.home,
                          color: ctx.selectedBottomNavigationBarIndex == 0
                              ? MHelperFunctions.isDarkMode(context)
                                  ? Colors.black
                                  : Colors.white
                              : MHelperFunctions.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black),
                      label: S.current.Home),
                  NavigationDestination(
                      icon: Icon(Iconsax.box,
                          color: ctx.selectedBottomNavigationBarIndex == 1
                              ? MHelperFunctions.isDarkMode(context)
                                  ? Colors.black
                                  : Colors.white
                              : MHelperFunctions.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black),
                      label: S.current.Categories),
                  NavigationDestination(
                      icon: Icon(Icons.favorite_border,
                          color: ctx.selectedBottomNavigationBarIndex == 2
                              ? MHelperFunctions.isDarkMode(context)
                                  ? Colors.black
                                  : Colors.white
                              : MHelperFunctions.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black),
                      label: S.current.Favourites),
                  NavigationDestination(
                      icon: Icon(Iconsax.discount_shape,
                          color: ctx.selectedBottomNavigationBarIndex == 3
                              ? MHelperFunctions.isDarkMode(context)
                                  ? Colors.black
                                  : Colors.white
                              : MHelperFunctions.isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black),
                      label: S.current.Offers),
                ],
                height: 60.h,
                animationDuration: Durations.long1,
                indicatorColor: MHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Color.fromARGB(255, 4, 180, 92).withOpacity(0.9),
                onDestinationSelected: (index) =>
                    ctx.onDestenationSelected(index),
                selectedIndex: ctx.selectedBottomNavigationBarIndex,
              ),
              body: GetBuilder<HomeScreenController>(builder: (cont) {
                return cont.changeCurrPage();
              })),
        );
      }),
    );
  }
}

class HorizontalListViewWrapContainer extends StatelessWidget {
  const HorizontalListViewWrapContainer({
    super.key,
    this.height,
    this.width = 60,
    this.imageWidth = 90,
    required this.listLength,
    required this.itemBuilder,
  });
  final double? height;
  final double imageWidth;
  final double width;
  final int listLength;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      height: 120.0.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listLength,
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class SectionRowHeader1 extends StatelessWidget {
  SectionRowHeader1({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
      child: Row(
        children: [
          Text(
            S.current.PopularCat,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          GestureDetector(
              child: Text(S.current.Seeall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: MHelperFunctions.isDarkMode(context)
                        ? Colors.lightBlue
                        : const Color.fromARGB(255, 1, 103, 187),
                  )),
              onTap: onTap),
        ],
      ),
    );
  }
}

class SectionRowHeader2 extends StatelessWidget {
  SectionRowHeader2({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Row(
        children: [
          Text(
            S.current.PopularSer,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          GestureDetector(
              child: Text(S.current.Seeall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: MHelperFunctions.isDarkMode(context)
                        ? Colors.lightBlue
                        : const Color.fromARGB(255, 1, 103, 187),
                  )),
              onTap: onTap),
        ],
      ),
    );
  }
}
