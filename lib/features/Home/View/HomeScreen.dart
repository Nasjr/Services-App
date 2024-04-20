import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/common/widgets/CustomCarousel/CustomCarousel.dart';
import 'package:ecommerce_application/common/widgets/CustomShapes/CircularContainer.dart';
import 'package:ecommerce_application/features/Home/Controller/HomeScreenController.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/features/Home/model/CategoryModel.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../SubCategoriesPage/View/SubCategoriesPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    HomeScreenController controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(bottomNavigationBar:
          GetBuilder<HomeScreenController>(builder: (context) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
                icon: Icon(Iconsax.home,
                    color: context.selectedBottomNavigationBarIndex == 0
                        ? MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.black
                            : Colors.white
                        : MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.white
                            : Colors.black),
                label: "Home"),
            NavigationDestination(
                icon: Icon(Iconsax.box,
                    color: context.selectedBottomNavigationBarIndex == 1
                        ? MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.black
                            : Colors.white
                        : MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.white
                            : Colors.black),
                label: "Categories"),
            NavigationDestination(
                icon: Icon(Icons.favorite_border,
                    color: context.selectedBottomNavigationBarIndex == 2
                        ? MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.black
                            : Colors.white
                        : MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.white
                            : Colors.black),
                label: "favorites"),
            NavigationDestination(
                icon: Icon(Iconsax.discount_shape,
                    color: context.selectedBottomNavigationBarIndex == 3
                        ? MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.black
                            : Colors.white
                        : MHelperFunctions.isDarkMode(Get.context!)
                            ? Colors.white
                            : Colors.black),
                label: "Offers"),
          ],
          height: 50.h,
          animationDuration: Durations.long1,
          indicatorColor: MHelperFunctions.isDarkMode(Get.context!)
              ? Colors.white
              : Colors.blue,
          onDestinationSelected: (index) =>
              context.onDestenationSelected(index),
          selectedIndex: context.selectedBottomNavigationBarIndex,
        );
      }), body: GetBuilder<HomeScreenController>(builder: (cont) {
        return cont.changeCurrPage();
      })),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    this.height,
    required this.imageWidth,
    required this.width,
    required this.categoriesList,
  });
  final double? height;
  final double imageWidth;
  final double width;
  final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 150.0,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10.w,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return GetBuilder<MainScreenController>(builder: (context) {
            return CustomCategory(
              categoryName: categoriesList[index].name,
              imageCategoryPath: categoriesList[index].imageUrl,
              width: width,
              imageWidth: imageWidth,
              index: index,
            );
          });
        },
      ),
    );
  }
}

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

class SectionRowHeader extends StatelessWidget {
  const SectionRowHeader({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: Row(
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          GestureDetector(
              child: Text('See all',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
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

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearch());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 55,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.search,
              size: 25.w,
              color: Colors.grey,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              'Search for Services',
              style: TextStyle(color: MColors.darkGrey, fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: MColors.light,
            size: 25,
          ),
        ),
        Positioned(
          right: 9,
          top: 8,
          child: Container(
            height: 12.h,
            width: 14.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.w),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                '12',
                style: TextStyle(fontSize: 6.sp, color: MColors.light),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final String value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: items,
      onChanged: onChanged,
      dropdownColor: const Color.fromARGB(255, 33, 122, 238),
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
    // TODO: implement buildLeading
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
        child: Text(filterlist[index]),
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
          },
          child: Card(
            color: MColors.lightContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                filterlist[index],
                style: TextStyle(fontSize: 12.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
