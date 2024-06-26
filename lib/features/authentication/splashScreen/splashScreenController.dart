import 'package:ecommerce_application/features/Home/View/NavigationView.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  Future<void> waitAndRedirectToHomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => HomeScreen());
  }

  @override
  void onInit() async {
    await waitAndRedirectToHomePage();
    super.onInit();
  }
}
