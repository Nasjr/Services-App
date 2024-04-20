import 'package:ecommerce_application/common/widgets/BrandCard.dart';
import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '$title Services'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 288,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2),
            itemBuilder: (context, index) => ProductCardVertical(
                  imagePath: MImages.productImage19,
                  onTapProduct: () async =>
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ServiceProviderPage(
                                title: 'Al Shabrawy',
                              ))),
                  title: 'AlShabrawy Resturant',
                )),
      ),
    );
  }
}
