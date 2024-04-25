import 'package:ecommerce_application/features/CategoriesPage/Model/CategoryModel.dart';
import 'package:ecommerce_application/features/CategoriesPage/Repository/CategoriesRepo.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final categoryRepo = Get.put(CategoriesRepo());
  List<CategoryModel> categoriesList = [];
  bool isloading = false;
  Future<void> fetchAllCategores() async {
    try {
      isloading = true;
      categoriesList.assignAll(await categoryRepo.getallCategories());
    } on Exception catch (e) {
      print(e);
    } finally {
      isloading = false;
      update();
    }
  }

  @override
  void onInit() {
    fetchAllCategores();
    super.onInit();
  }
}
