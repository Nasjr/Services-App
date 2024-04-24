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
    final homeController = Get.put(HomeScreenController());
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

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    this.height,
    this.width = 60,
    this.imageWidth = 90,
    required this.servicesList,
  });
  final double? height;
  final double imageWidth;
  final double width;
  final List<ServicesModel> servicesList;
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
        itemCount: servicesList.length,
        itemBuilder: (context, index) {
          return GetBuilder<MainScreenController>(builder: (context) {
            return CustomCategory(
                isNetworkImage: false,
                index: index,
                categoryName: servicesList[index].name,
                imageCategoryPath: MImages.productImage1);
          });
        },
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
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

class CustomSearch extends SearchDelegate {
  List<String> suggestions = [
    'Shabrawy',
    'Al Wafaa Football',
    'Al Amal clinic',
    'Circle K'
  ];
  List<String> filterlist = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: filterlist.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.w),
        child: Text(
          filterlist[index],
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filterlist = suggestions
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filterlist.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: GestureDetector(
          onTap: () {
            print(filterlist[index]);
            Get.to(() => ServiceProviderPage(
                servicePorvider: ServicesModel(
                    parentName: 'parentCategory',
                    name: '${filterlist[index]}',
                    phoneNumber: '01153453880',
                    whatsappNumber: '01153453880',
                    description:
                        'description description description description description',
                    imagePath: '')));
          },
          child: Card(
            color: MColors.lightContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                filterlist[index],
                style: TextStyle(fontSize: 12.w, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
