import 'package:ecommerce_application/common/styles/spacingStyles.dart';
import 'package:ecommerce_application/common/widgets/TextFormWidget.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Login.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginFooter.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginForm.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginHeader.dart';
import 'package:ecommerce_application/common/widgets/SuccessScreen/SucessScreen.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/constants/text_strings.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/DividerWidget.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => LoginScreen());
              },
              icon: const Icon(CupertinoIcons.clear)),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MspacingStyle.paddingNoAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Image(
                image: const AssetImage(MImages.deliveredEmailIllustration),
                width: MHelperFunctions.screenWidth() * 0.6.w,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSections,
              ),
              // Text
              Text(
                MTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwItems,
              ),
              Text(
                'mahmoudnasserfcis@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MSizes.spaceBtwItems.h,
              ),
              Text(
                MTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MSizes.spaceBtwSections.h,
              ),
              // Divider
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => SuccessScreen(
                              image: MImages.deliveredEmailIllustration,
                              title: MTexts.yourAccountCreatedTitle,
                              subtitle: MTexts.yourAccountCreatedSubTitle,
                              onPressed: () =>
                                  Get.offAll(() => const LoginScreen()),
                            ));
                      },
                      child: const Text(MTexts.tContinue))),
              SizedBox(
                height: MSizes.spaceBtwSections.h,
              ),
              // Footer
              TextButton(
                  onPressed: () {}, child: const Text(MTexts.resendEmail))
            ],
          ),
        ),
      ),
    );
  }
}
