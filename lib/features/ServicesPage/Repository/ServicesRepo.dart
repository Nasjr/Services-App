import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/features/CategoriesPage/Model/CategoryModel.dart';
import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Model/SubCategoriesModel.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:ecommerce_application/utils/network/firebase_client.dart';
import 'package:get/get.dart';

class ServicesRepo extends GetxController {
  final servicessRef = FirebaseClient.db.collection('Services');

  Future<List<ServicesModel>> getallSubCategoriesbyParent(
      String parentName) async {
    // Get all documents at once
    try {
      QuerySnapshot snapshot = await servicessRef
          .where('zone',
              isEqualTo: AppLocalStorage().readData(LocalDataSourceKeys.zone))
          .get();

      return snapshot.docs
          .map(
              (doc) => ServicesModel.mapFirestoreToCategoryModel(doc))
          .whereType<ServicesModel>()
          .toList();
    } on FirebaseException catch (e) {
      print("Herreee 1 $e");
      return [];
    }
  }
}
