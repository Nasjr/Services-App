// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:garednia_app/features/CategoriesPage/Model/CategoryModel.dart';
// import 'package:garednia_app/features/Home/model/bannersModel.dart';
// import 'package:garednia_app/features/ServicesPage/Model/ServicesModel.dart';
// import 'package:garednia_app/utils/network/firebase_client.dart';
// import 'package:get/get.dart';

// class HomePageRepo extends GetxController {
//   final categoriesRef = FirebaseClient.db.collection('Categories');
//   final bannersRef = FirebaseClient.db.collection('Banners');
//   final servicesRef = FirebaseClient.db.collection('Services');

//   Future<List<CategoryModel>> getCategoriesFeatured() async {
//     // Get all documents at once
//     try {
//       QuerySnapshot snapshot =
//           await categoriesRef.where('isFeatured', isEqualTo: true).get();

//       print(snapshot.docs);
//       return snapshot.docs
//           .map((doc) => CategoryModel.mapFirestoreToCategoryModel(doc))
//           .whereType<CategoryModel>()
//           .toList();
//     } on FirebaseException catch (e) {
//       print(e);
//       return [];
//     }
//   }

//   Future<List<ServicesModel>> getServicesFeatured() async {
//     // Get all documents at once
//     try {
//       QuerySnapshot snapshot =
//           await servicesRef.where('isFeatured', isEqualTo: true).get();

//       print(snapshot.docs);
//       return snapshot.docs
//           .map((doc) => ServicesModel.mapFirestoreToCategoryModel(doc))
//           .whereType<ServicesModel>()
//           .toList();
//     } on FirebaseException catch (e) {
//       print(e);
//       return [];
//     }
//   }

//   Future<List<BannersModel>> getBannersFetured() async {
//     // Get all documents at once
//     try {
//       QuerySnapshot snapshot = await bannersRef.get();

//       print(snapshot.docs);
//       return snapshot.docs
//           .map((doc) => BannersModel.mapFirestoreToCategoryModel(doc))
//           .whereType<BannersModel>()
//           .toList();
//     } on FirebaseException catch (e) {
//       print(e);
//       return [];
//     }
//   }
// }
