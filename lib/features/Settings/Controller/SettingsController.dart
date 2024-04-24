import 'package:ecommerce_application/features/Home/Controller/HomeScreenController.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

class SettingsController extends GetxController {
  void switchTheme() {
    if (AppLocalStorage().readData(LocalDataSourceKeys.theme) == 'light') {
      AppLocalStorage().saveData(LocalDataSourceKeys.theme, 'dark');
      Get.changeTheme(ThemeData.dark());
      update();
      Get.appUpdate();
    } else {
      AppLocalStorage().saveData(LocalDataSourceKeys.theme, 'light');
      Get.changeTheme(ThemeData.light());
      update();
      Get.appUpdate();
    }
  }

  void switchLanguage() {
    if (AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar') {
      AppLocalStorage().saveData(LocalDataSourceKeys.localization, 'en');
      Get.updateLocale(
          Locale(AppLocalStorage().readData(LocalDataSourceKeys.localization)));
      MainScreenController.instance.initializeZonesList();
      Get.back();
      print(S.current.PopularCat);
    } else {
      AppLocalStorage().saveData(LocalDataSourceKeys.localization, 'ar');
      Get.updateLocale(
          Locale(AppLocalStorage().readData(LocalDataSourceKeys.localization)));
      Get.back();
      MainScreenController.instance.initializeZonesList();
    }
  }
}
