import 'package:ecommerce_application/common/styles/spacingStyles.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginFooter.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginForm.dart';
import 'package:ecommerce_application/features/authentication/Login/views/Widgets/loginHeader.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/DividerWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MspacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header
              HeaderWidget(),
              // Form
              FormWidget(),
              // Divider
              DividerWidget(
                dividerText: MTexts.orSignInWith,
              ),
              SizedBox(
                height: MSizes.spaceBtwItems,
              ),
              // Footer
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
