import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  @override
  // Variables
  PageController pageController = PageController();
  Rx<int> currPageIndex = 0.obs;
  // Update curr index when page scroll
  void updatePageIndicator(int index) {
    currPageIndex(index);
  }

  // Jump to page when a dot is clicked
  void dotNavigationOnclick(int index) {
    currPageIndex(index);
    pageController.animateToPage(currPageIndex.value,
        curve: Curves.easeInOutCirc,
        duration: const Duration(milliseconds: 400));
  }

  // Jump to NEXT page when a dot is clicked
  void nextPage() {
    if (currPageIndex.value == 2) {
      AppLocalStorage().saveData(LocalDataSourceKeys.isFirstTime, false);
      Get.offAll(() => const HomeScreen());
    } else {
      int page = currPageIndex.value + 1;
      pageController.animateToPage(page,
          curve: Curves.easeInOutCirc,
          duration: const Duration(milliseconds: 400));
    }
  }

  // Jump to Last page when a dot is clicked
  void skipPage() {
    currPageIndex.value = 2;
    pageController.animateToPage(currPageIndex.value,
        curve: Curves.easeInOutCirc,
        duration: const Duration(milliseconds: 400));
  }
}
