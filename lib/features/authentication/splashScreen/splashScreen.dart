import 'package:ecommerce_application/features/authentication/splashScreen/splashScreenController.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                  width: 120.w,
                  height: 200.h,
                  fit: BoxFit.contain,
                  'assets/images/animations/GardeniaLogo.gif'),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Gardenia Application",
              style: TextStyle(
                  color: MHelperFunctions.isDarkMode(context)
                      ? const Color.fromARGB(255, 105, 202, 108)
                      : const Color.fromARGB(255, 53, 129, 56),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Revolutionizing Compound Services",
              style: TextStyle(
                  color: MHelperFunctions.isDarkMode(context)
                      ? MColors.white
                      : MColors.darkerGrey,
                  fontSize: 8.sp),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )),
    );
  }
}
