import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/features/CategoriesPage/Model/CategoryModel.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Controller/SubCategoriesController.dart';
import 'package:ecommerce_application/features/SubCategoriesPage/Model/SubCategoriesModel.dart';
import 'package:ecommerce_application/utils/network/firebase_client.dart';
import 'package:get/get.dart';


class SubCategoriesRepo extends GetxController {
  final categoriesRef = FirebaseClient.db.collection('subCategories');

  Future<List<SubCategoriesModel>> getallSubCategoriesbyParent(String title) async {
    // Get all documents at once
    try {
      QuerySnapshot snapshot =
          await categoriesRef.get();

      print(snapshot.docs);
      return snapshot.docs
          .map((doc) => SubCategoriesModel.mapFirestoreToSubCategoriesModel(doc))
          .whereType<SubCategoriesModel>()
          .toList();
    } on FirebaseException catch (e) {
      print("Herreee 1 $e");
      return [];
    }
  }

}
