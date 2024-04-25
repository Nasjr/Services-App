import 'package:ecommerce_application/common/widgets/BrandCard.dart';
import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';
import 'package:ecommerce_application/features/ServicesPage/Controller/ServicesController.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key, required this.parentSubCategoryName});
  final String parentSubCategoryName;

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesContorller(parentSubCategoryName));
    return Scaffold(
      appBar: CustomAppBar(title: '$parentSubCategoryName Services'),
      body: GetBuilder<ServicesContorller>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.all(20.0.w),
          child: controller.isloading == true
              ? CircularProgressIndicator()
              : controller.servicesList.length == 0
                  ? Center(
                      child: Text(S.current.NoItemsFound),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: controller.servicesList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 288,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => ProductCardVertical(
                            imagePath: controller.servicesList[index].imageUrl,
                            onTapProduct: () {
                              Get.to(() => ServiceProviderPage(
                                    servicePorvider:
                                        controller.servicesList[index],
                                  ));
                            },
                            title: controller.servicesList[index].name,
                          )),
        );
      }),
    );
  }
}
