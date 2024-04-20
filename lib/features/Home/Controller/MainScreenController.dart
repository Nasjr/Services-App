import 'package:ecommerce_application/features/Home/View/Widgets/Roundedbanner.dart';
import 'package:ecommerce_application/features/Home/model/CategoryModel.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  static MainScreenController get instance => Get.find();
  int currIndex = 0;
  String currZone = 'All Zones';
  List<String> zones = ['All Zones', 'Zone 1', 'Zone 2', 'Zone 3'];
  List<String> banners = [MImages.banner5, MImages.banner8, MImages.banner6];
  @override
  void onInit() {
    mapCategories();
    super.onInit();
  }

  final categories = [
    {
      "name": "Restaurants",
      "imageUrl":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Bakeries",
      "imageUrl":
          "https://th.bing.com/th/id/OIP.UQelnFFX7vihRqgND4YzUQHaGV?rs=1&pid=ImgDetMain"
    },
    {
      "name": "Cafes",
      "imageUrl":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Grocery Stores",
      "imageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Pharmacies",
      "imageUrl":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Gyms & Fitness",
      "imageUrl":
          "https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Gas Stations",
      "imageUrl":
          "https://th.bing.com/th/id/R.33d2bd74f89702eb44df6b55869d4ee0?rik=UJzCDuPKmO5zYw&riu=http%3a%2f%2fwww.secanopies.com%2fwp-content%2fuploads%2f2018%2f07%2fCB-Shell.jpg&ehk=B2Q8QLbEHwuZONWlSc1ieZKJv6x0lUKFVOwjNU8KGHs%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "name": "Salons",
      "imageUrl":
          "https://i.pinimg.com/originals/1f/07/30/1f0730df29a4bf396412755530ab4e4c.jpg"
    },
    {
      "name": "Laundry",
      "imageUrl":
          "https://th.bing.com/th/id/R.03332ec9e8b34c0e4fea59e1674b9b1b?rik=HZu%2b3uGtCYbmDQ&pid=ImgRaw&r=0"
    },
    {
      "name": "Dry Cleaners",
      "imageUrl":
          "https://jla.com/wp-content/uploads/2021/04/LaundryHygiene800x800.jpg"
    }
  ];
  List<CategoryModel> categoryList = [];

  void mapCategories() {
    categoryList =
        categories.map((item) => CategoryModel.fromJson(item)).toList();
  }

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
