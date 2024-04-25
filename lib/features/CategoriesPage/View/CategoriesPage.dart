import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/CategoriesPage/Controller/CategoriesController.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/features/Home/View/NavigationView.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/View/SubCategoriesPage.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import '../../../utils/local_storage/local_storage.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic =
        AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar';
    Get.lazyPut(() => CategoriesController());
    return Scaffold(
      appBar: CustomAppBar(
        title: S.current.Categories,
      ),
      body: GetBuilder<CategoriesController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: controller.isloading
              ? CircularProgressIndicator()
              : controller.categoriesList.length == 0
                  ? Center(
                      child: Text(S.current.NoItemsFound),
                    )
                  : GridView.builder(
                      itemCount: controller.categoriesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 30),
                      itemBuilder: (context, index) => CustomCategory(
                        categoryName: isArabic
                            ? controller.categoriesList[index].nameAR!
                            : controller.categoriesList[index].name!,
                        imageCategoryPath:
                            controller.categoriesList[index].imageUrl!,
                        imageWidth: double.infinity,
                        onTap: () async {
                          Get.to(() => SubCategoriesPage(
                                categoryModel: controller.categoriesList[index],
                              ));
                        },
                        index: index,
                      ),
                    ),
        );
      }),
    );
  }
}
