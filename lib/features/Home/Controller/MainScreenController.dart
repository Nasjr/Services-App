import 'package:ecommerce_application/features/Home/View/Widgets/Roundedbanner.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  int currIndex = 0;
  String currZone = 'All Zones';
  List<String> zones = ['All Zones', 'Zone 1', 'Zone 2', 'Zone 3'];
  List<String> banners = [MImages.banner5, MImages.banner8, MImages.banner6];

  void onZoneChanged(String? zone) {
    currZone = zone!;
    update();
  }

  void onPageChanged(int index) {
    currIndex = index;
    update(['CrouselBuilder']);
  }

  onTapCarousel(int index) {
    print(index);
  }
}
