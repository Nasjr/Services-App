import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/common/widgets/CustomShapes/CircularContainer.dart';
import 'package:ecommerce_application/features/Home/View/Widgets/Roundedbanner.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required this.banners,
    this.onPageChanged,
    required this.currentIndex,
    this.onTap,
  });

  final List<String> banners;
  final int currentIndex;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CarouselSlider(
              items: [
                for (int i = 0; i < banners.length; i++)
                  GestureDetector(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: MRoundedImageWidget(
                      applyRadius: false,
                      imageUrl: banners[i],
                      border: null,
                    ),
                  ),
              ],
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                onPageChanged: onPageChanged,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                CircularContainer(
                  gradient: currentIndex == i
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: MHelperFunctions.isDarkMode(context)
                              ? [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 255, 255, 255),
                                ]
                              : [
                                  Color.fromARGB(255, 3, 136, 59),
                                  Color.fromARGB(255, 4, 180, 92)
                                      .withOpacity(0.9),
                                ],
                        )
                      : null,
                  width: 20,
                  height: 5,
                  margin: EdgeInsets.only(right: 10.w),
                  backgroundColor: const Color.fromARGB(255, 105, 105, 105),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
