import 'package:ecommerce_application/features/FavoritesPage/View/Favorites.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/OffersPage/View/OffersPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CategoriesPage/View/CategoriesPage.dart';

class HomeScreenController extends GetxController {
  int selectedBottomNavigationBarIndex = 0;
  String currZone = 'All Zones';

   onDestenationSelected(int index) {
    selectedBottomNavigationBarIndex = index;
    print(selectedBottomNavigationBarIndex);
    update();
  }

  Widget changeCurrPage() {
    print('Here');
    if (selectedBottomNavigationBarIndex == 0) {
      return const MainPage();
    } else if (selectedBottomNavigationBarIndex == 1) {
      return const CategoriesPage();
    } else if (selectedBottomNavigationBarIndex == 2) {
      return const FavoritesPage();
    }
    return const OffersPage();
  }
}
