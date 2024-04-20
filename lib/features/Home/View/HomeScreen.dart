import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/common/widgets/CustomCarousel/CustomCarousel.dart';
import 'package:ecommerce_application/common/widgets/CustomShapes/CircularContainer.dart';
import 'package:ecommerce_application/features/Home/Controller/HomeScreenController.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                icon: Icon(
                  Iconsax.home,
                  color: context.selectedBottomNavigationBarIndex == 0
                      ? Colors.white
                      : Colors.black,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  Iconsax.box,
                  color: context.selectedBottomNavigationBarIndex == 1
                      ? Colors.white
                      : Colors.black,
                ),
                label: "Categories"),
            NavigationDestination(
                icon: Icon(
                  Icons.favorite_border,
                  color: context.selectedBottomNavigationBarIndex == 2
                      ? Colors.white
                      : Colors.black,
                ),
                label: "favorites"),
            NavigationDestination(
                icon: Icon(
                  Iconsax.discount_shape,
                  color: context.selectedBottomNavigationBarIndex == 3
                      ? Colors.white
                      : Colors.black,
                ),
                label: "Offers"),
          ],
          height: 50.h,
          animationDuration: Durations.long1,
          indicatorColor: Colors.blue,
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

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0E3EDA).withOpacity(0.9),
                  const Color.fromARGB(255, 66, 177, 236),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.w),
                  bottomRight: Radius.circular(0.w))),
          padding:
              EdgeInsets.only(top: 15.h, bottom: 10.h, left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<MainScreenController>(builder: (cont) {
                return Row(
                  children: [
                    CustomDropDown(
                        value: cont.currZone,
                        items: cont.zones.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              'Selected Zone ($value)',
                              style: TextStyle(
                                  fontSize: 10.sp, color: MColors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (zone) => cont.onZoneChanged(zone)),
                    const Spacer(),
                    const NotificationsWidget(),
                    IconButton(
                      onPressed: () => print("object"),
                      icon: Icon(
                        Icons.settings,
                        size: 25.w,
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Hi, UserId: 34948456578346',
                style: TextStyle(
                    color: MColors.light,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              SearchWidget()
            ],
          ),
        ),
        GetBuilder<MainScreenController>(
            id: 'CrouselBuilder',
            builder: (contr) {
              return CustomCarousel(
                  onPageChanged: (index, _) => contr.onPageChanged(index),
                  banners: contr.banners,
                  currentIndex: contr.currIndex);
            }),
        SizedBox(
          height: 10.h,
        ),
        SectionRowHeader(
          title: 'Popular Categories',
        ),
        HorizontalListView(
            categoryName: "Resturants",
            imageWidth: double.infinity,
            itemCount: 10,
            width: 140,
            imageCategoryPath: MImages.productImage1),
        SectionRowHeader(
          title: 'Popular Services',
        ),
        HorizontalListView(
            categoryName: "Shabrawy",
            imageWidth: double.infinity,
            itemCount: 6,
            width: 140,
            imageCategoryPath: MImages.productImage20),
      ],
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.itemCount,
    this.height,
    required this.categoryName,
    required this.imageCategoryPath,
    required this.imageWidth,
    required this.width,
  });
  final int itemCount;
  final double? height;
  final String categoryName;
  final String imageCategoryPath;
  final double imageWidth;
  final double width;
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomCategory(
            categoryName: categoryName,
            imageCategoryPath: imageCategoryPath,
            width: width,
            imageWidth: imageWidth,
            index: index,
          );
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
  });
  final int index;
  final double width, height;
  final double imageWidth, imageHeight;
  final String categoryName;
  final String imageCategoryPath;
  final void Function()? onTap;
  final EdgeInsetsGeometry categoryNamePadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 214, 212, 212),
            borderRadius: BorderRadius.circular(20.w)),
        height: height.h,
        width: width.w,
        child: Stack(
          children: [
            ClipRRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Image.asset(
                  width: imageWidth,
                  alignment: Alignment.center,
                  imageCategoryPath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: categoryNamePadding,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '$categoryName',
                  style: TextStyle(
                      color: Color.fromARGB(225, 255, 255, 255),
                      fontSize: 14.sp,
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
  });
  final String title;
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
                      ? Colors.white
                      : const Color.fromARGB(255, 1, 103, 187),
                )),
            onTap: () {
              print('See all');
            },
          ),
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
