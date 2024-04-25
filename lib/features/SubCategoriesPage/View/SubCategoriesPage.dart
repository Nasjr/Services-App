import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/common/widgets/CustomCategoryWidget/CustomCategoryWidget.dart';
import 'package:ecommerce_application/features/CategoriesPage/Model/CategoryModel.dart';
import 'package:ecommerce_application/features/Home/View/NavigationView.dart';
import 'package:ecommerce_application/features/ServicesPage/Controller/ServicesController.dart';
import 'package:ecommerce_application/features/ServicesPage/View/ServicesPage.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesPage extends StatelessWidget {
  SubCategoriesPage({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  final isArabic =
      AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar';
  @override
  Widget build(BuildContext context) {
    Get.put(SubCategoriesController(categoryModel.name!));
    return Scaffold(
      appBar: CustomAppBar(
        title: '${isArabic ? categoryModel.nameAR : categoryModel.name}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SubCategoriesController.instace.currSubCategory.isEmpty
            ? Center(
                child: Text(
                  S.current.NoItemsFound,
                  textAlign: TextAlign.center,
                ),
              )
            : GetBuilder<SubCategoriesController>(builder: (ctrl) {
                return GridView.builder(
                  itemCount: ctrl.currSubCategory.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 288,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 40),
                  itemBuilder: (context, index) => CustomCategory(
                    categoryName: ctrl.currSubCategory[index].name,
                    imageCategoryPath: ctrl.currSubCategory[index].imageUrl,
                    imageWidth: double.infinity,
                    onTap: () async {
                      ServicesContorller.instance
                          .filterDataSrc(ctrl.currSubCategory[index].name);
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ServicesPage(
                                title: ctrl.currSubCategory[index].name,
                              )));
                    },
                    index: index,
                  ),
                );
              }),
      ),
    );
  }
}
