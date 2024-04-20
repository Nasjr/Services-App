import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Offers',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30),
          itemBuilder: (context, index) => CustomCategory(
            categoryName: "Sea food",
            imageCategoryPath: MImages.productImage10,
            imageWidth: double.infinity,
            index: index,
          ),
        ),
      ),
    );
  }
}

