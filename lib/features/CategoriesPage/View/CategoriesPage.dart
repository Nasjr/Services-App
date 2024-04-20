import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/View/SubCategoriesPage.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: MainScreenController.instance.categoryList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30),
          itemBuilder: (context, index) => CustomCategory(
            categoryName:
                MainScreenController.instance.categoryList[index].name,
            imageCategoryPath:
                MainScreenController.instance.categoryList[index].imageUrl,
            imageWidth: double.infinity,
            onTap: () async {
              SubCategoriesController.instace.filterByParentCategory(
                  MainScreenController.instance.categoryList[index].name);
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SubCategoriesPage(
                        title: MainScreenController
                            .instance.categoryList[index].name,
                      )));
            },
            index: index,
          ),
        ),
      ),
    );
  }
}
