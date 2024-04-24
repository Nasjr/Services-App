import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/onboarding.dart';
import 'package:ecommerce_application/features/authentication/splashScreen/splashScreen.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  // @override
  // void onReady() {

  //   super.onReady();
  // }
  @override
  void onInit() {
    settingInit();
    super.onInit();
  }

  @override
  void onReady() async {
    // await Future.delayed(Duration(seconds: 2), () {
    //   screeenRedirect();
    // });
    super.onReady();
  }

  void screeenRedirect() {
    if (AppLocalStorage().readData(LocalDataSourceKeys.isFirstTime) == null) {
      AppLocalStorage().saveData(LocalDataSourceKeys.isFirstTime, true);
    }
    AppLocalStorage().readData(LocalDataSourceKeys.isFirstTime) != true
        ? Get.offAll(() => SplashScreen())
        : Get.offAll(() => OnboardingScreen());
  }

  void settingInit() {
    if (AppLocalStorage().readData(LocalDataSourceKeys.localization) == null) {
      AppLocalStorage().saveData(LocalDataSourceKeys.localization, 'ar');
      print(AppLocalStorage().readData(LocalDataSourceKeys.localization));
    }
    AppLocalStorage()
        .saveData(LocalDataSourceKeys.theme, Get.isDarkMode ? 'dark' : 'light');
  }
}
