import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/ServicesPage/View/ServicesPage.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubCategoriesPage extends StatelessWidget {
  const SubCategoriesPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    Get.put(SubCategoriesController(title));
    return Scaffold(
      appBar: CustomAppBar(
        title: '$title',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SubCategoriesController.instace.currSubCategory.isEmpty
            ? Center(
                child: Text(
                  'No SubCategories For this Category yet',
                  textAlign: TextAlign.center,
                ),
              )
            : GridView.builder(
                itemCount:
                    SubCategoriesController.instace.currSubCategory.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 288,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 40),
                itemBuilder: (context, index) => CustomCategory(
                  categoryName: SubCategoriesController
                      .instace.currSubCategory[index].name,
                  imageCategoryPath: SubCategoriesController
                      .instace.currSubCategory[index].imageUrl,
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
