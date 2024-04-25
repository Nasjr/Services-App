import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoriesModel {
  final String? name;
  final String? parentCategoryName;
  final String? imageUrl;
  final String? nameAR;
  final Timestamp? updateDate;
  SubCategoriesModel(
      {required this.nameAR,
      required this.parentCategoryName,
      required this.updateDate,
      required this.name,
      required this.imageUrl});

  // From JSON
  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
        name: json['name'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        nameAR: json['nameAR' ?? ''],
        updateDate: json['updateDate'] ?? Timestamp.now(),
        parentCategoryName: json['parentCategoryName'] ?? '');
  }

  // From DocSnapshot
  factory SubCategoriesModel.mapFirestoreToSubCategoriesModel(
      DocumentSnapshot doc) {
    // Get data from the document
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Extract and handle missing fields with default values
    return SubCategoriesModel(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      nameAR: data['nameAR'] ?? '',
      updateDate: data['updateDate'] ?? Timestamp.now(),
      parentCategoryName: data['parentCategoryName'] ?? '',
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'nameAR': nameAR,
      'updateDate': updateDate,
      "parentCategoryName": parentCategoryName
    };
  }
}
