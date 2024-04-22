import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/CustomCarousel/CustomCarousel.dart';
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
        Container(
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
                      onPressed: () => print('Settings'),
                      icon: Icon(
                        Icons.settings,
                        size: 25.w,
                        color: Colors.white,
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
        GetBuilder<HomeScreenController>(builder: (ctx) {
          return SectionRowHeader(
            title: 'Popular Categories',
            onTap: () => ctx.onDestenationSelected(1),
          );
        }),
        GetBuilder<MainScreenController>(builder: (ctx) {
          return HorizontalListView(
            categoriesList: ctx.categoryList,
            imageWidth: double.infinity,
            width: 140.h,
          );
        }),
        SectionRowHeader(
          title: 'Popular Services',
          onTap: () async => await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SubCategoriesPage(
                    title: 'Resturants',
                  ))),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: GetBuilder<MainScreenController>(builder: (ctx) {
            return HorizontalListView(
              categoriesList: ctx.categoryList,
              imageWidth: double.infinity,
              width: 140.h,
            );
          }),
        ),
      ],
    );
  }
}
