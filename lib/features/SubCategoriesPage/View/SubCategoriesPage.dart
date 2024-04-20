import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/ServicesPage/View/ServicesPage.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '$title',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 288,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 40),
          itemBuilder: (context, index) => CustomCategory(
            categoryName: "Resturants",
            imageCategoryPath: MImages.productImage2,
            imageWidth: double.infinity,
            onTap: () async =>
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ServicesPage(
                          title: 'Resturants',
                        ))),
            index: index,
          ),
        ),
      ),
    );
  }
}
