import 'package:ecommerce_application/features/authentication/Onboarding/controllers/onboarding_controller.dart';
import 'package:ecommerce_application/utils/constants/sizes.dart';
import 'package:ecommerce_application/utils/constants/text_strings.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSections),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: MTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(
            height: MSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: MTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(Iconsax.eye_slash),
                  onPressed: () {},
                )),
          ),
          const SizedBox(
            height: MSizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text(MTexts.rememberMe),
                ],
              ),
              // Forget Password
              TextButton(
                  onPressed: () {}, child: const Text(MTexts.forgetPassword))
            ],
          ),
          const SizedBox(
            height: MSizes.spaceBtwInputFields,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(MTexts.signIn))),
          const SizedBox(
            height: MSizes.spaceBtwItems,
          ),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text(MTexts.createAccount))),
        ],
      )),
    );
  }
}
