import 'package:ecommerce_application/features/SubCategoriesPage/Repository/subCategoriesRepo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../Model/SubCategoriesModel.dart';

class SubCategoriesController extends GetxController {
  SubCategoriesController(this.title);

  String title;
  static SubCategoriesController get instace => Get.find();
  List<SubCategoriesModel> subCategoriesList = [];
  bool isloading = false;
  final subCategoryRepo = Get.put(SubCategoriesRepo());

  void fetchByParentCategory(String Category) async {
    try {
      isloading = true;
      subCategoriesList
          .assignAll(await subCategoryRepo.getallSubCategoriesbyParent(title));
    } catch (e) {
    } finally {
      isloading = false;
      update();
    }
  }

  @override
  void onInit() async {
    fetchByParentCategory(title);

    super.onInit();
  }
}
