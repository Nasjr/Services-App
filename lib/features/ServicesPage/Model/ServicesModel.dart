import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/foundation.dart';

class ServicesModel {
  // {
  //   "parent_name": "Italian Restaurants",
  //   "name": "La Trattoria",
  //   "description": "Authentic Italian cuisine in a cozy atmosphere.",
  //   "phone_number": "+1-555-1234",
  //   "whatsapp_number": "+1-555-5678"
  // },
  final String parentSubCategory;
  final String name;
  final String phoneNumber;
  final String whatsappNumber;
  final String description;
  final String imageUrl;
  final String descriptionAR;
  final String nameAR;
  final Timestamp updateDate;
  final bool isFeatured;

  ServicesModel(
      {required this.descriptionAR,
      required this.nameAR,
      required this.isFeatured,
      required this.parentSubCategory,
      required this.name,
      required this.phoneNumber,
      required this.updateDate,
      required this.whatsappNumber,
      required this.description,
      required this.imageUrl});

  // from JsonConstructor
  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        parentSubCategory: json['parentSubCategory'] ?? '',
        name: json['name'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        whatsappNumber: json['whatsappNumber'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imagePath'] ?? MImages.productImage1,
        descriptionAR: json['descriptionAR'],
        nameAR: json['nameAR'],
        isFeatured: json['isFeatured'],
        updateDate: json['updateDate']);
  }

  factory ServicesModel.mapFirestoreToCategoryModel(DocumentSnapshot doc) {
    // Get data from the document
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Extract and handle missing fields with default values
    return ServicesModel(
        parentSubCategory: doc['parentSubCategory'] ?? '',
        name: doc['name'] ?? '',
        phoneNumber: doc['phoneNumber'] ?? '',
        whatsappNumber: doc['whatsappNumber'] ?? '',
        description: doc['description'] ?? '',
        imageUrl: doc['imageUrl'] ?? '',
        descriptionAR: doc['descriptionAR'] ?? '',
        nameAR: doc['nameAR'] ?? '',
        updateDate: doc['updateDate'] ?? Timestamp.now(),
        isFeatured: doc['isFeatured']);
  }
  // To JsonConstructor
  Map<String, dynamic> toJson(ServicesModel model) {
    return {
      'parentSubCategory': model.parentSubCategory,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'imageUrl': model.imageUrl,
      'whatsappNumber': model.whatsappNumber,
      'description': model.description,
      'descriptionAR': descriptionAR,
      'nameAR': nameAR,
      'updateDate': updateDate
    };
  }
}
