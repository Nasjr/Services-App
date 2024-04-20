import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/onboarding.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screeenRedirect();
    super.onReady();
  }

  void screeenRedirect() {
    if (AppLocalStorage().readData(LocalDataSourceKeys.isFirstTime) == null) {
      AppLocalStorage().saveData(LocalDataSourceKeys.isFirstTime, true);
    }
    AppLocalStorage().readData(LocalDataSourceKeys.isFirstTime) != true
        ? Navigator.of(Get.context!)
            .push(MaterialPageRoute(builder: (context) => const HomeScreen()))
        : Navigator.of(Get.context!)
            .push(MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }
}
