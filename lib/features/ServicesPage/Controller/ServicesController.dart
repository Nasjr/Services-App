import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:ecommerce_application/features/ServicesPage/Repository/ServicesRepo.dart';
import 'package:get/get.dart';

class ServicesContorller extends GetxController {
  ServicesContorller(String this.parentname);
  String parentname;
  static ServicesContorller get instance => Get.find();
  List<ServicesModel> servicesList = [];
  final ServicesRepo servicesRepo = Get.put(ServicesRepo());
  bool isloading = false;

  @override
  void onInit() {
    fetchServicesbyParentName(parentname);
    super.onInit();
  }

  Future<void> fetchServicesbyParentName(String parentName) async {
    try {
      isloading = true;
      servicesList.assignAll(
          await servicesRepo.getallSubCategoriesbyParent(parentName));
    } on Exception catch (e) {
      print(e);
    } finally {
      isloading = false;
      update();
    }
  }
}
