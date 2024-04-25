import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/features/CategoriesPage/Model/CategoryModel.dart';
import 'package:ecommerce_application/features/Home/model/bannersModel.dart';
import 'package:ecommerce_application/utils/network/firebase_client.dart';
import 'package:get/get.dart';

import '../../ServicesPage/Model/ServicesModel.dart';

class CategoriesRepo extends GetxController {
  final categoriesRef = FirebaseClient.db.collection('Categories');

  Future<List<CategoryModel>> getallCategories() async {
    // Get all documents at once
    try {
      QuerySnapshot snapshot =
          await categoriesRef.get();

      print(snapshot.docs);
      return snapshot.docs
          .map((doc) => CategoryModel.mapFirestoreToCategoryModel(doc))
          .whereType<CategoryModel>()
          .toList();
    } on FirebaseException catch (e) {
      print("Herreee 1 $e");
      return [];
    }
  }

}
