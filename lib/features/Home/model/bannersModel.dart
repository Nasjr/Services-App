import 'package:cloud_firestore/cloud_firestore.dart';

class BannersModel {
  final String parentSubCategory;
  final String serviceName;
  final String nameAR;
  final String phoneNumber;
  final String whatsappNumber;
  final String description;
  final String descreptionAR;
  final String imageUrl;
  final Timestamp updateDate;

  BannersModel(
      {required this.parentSubCategory,
      required this.serviceName,
      required this.phoneNumber,
      required this.whatsappNumber,
      required this.description,
      required this.imageUrl,
      required this.descreptionAR,
      required this.nameAR,
      required this.updateDate});

  // from JsonConstructor
  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
        parentSubCategory: json['parentSubCategory'] ?? '',
        serviceName: json['serviceName'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        whatsappNumber: json['whatsappNumber'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        descreptionAR: json['descreptionAR'] ?? '',
        nameAR: json['nameAR'] ?? '',
        updateDate: json['updateDate'] ?? Timestamp.now());
  }
  // from document
  factory BannersModel.mapFirestoreToCategoryModel(DocumentSnapshot doc) {
    // Get data from the document
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Extract and handle missing fields with default values
    return BannersModel(
        parentSubCategory: doc['parentSubCategory'] ?? '',
        serviceName: doc['serviceName'] ?? '',
        phoneNumber: doc['phoneNumber'] ?? '',
        whatsappNumber: doc['whatsappNumber'] ?? '',
        description: doc['description'] ?? '',
        imageUrl: doc['imageUrl'] ?? '',
        descreptionAR: doc['descreptionAR'] ?? '',
        nameAR: doc['nameAR'] ?? '',
        updateDate: doc['updateDate'] ?? Timestamp.now());
  }
  // To JsonConstructor
  Map<String, dynamic> toJson(BannersModel model) {
    return {
      'parentName': model.parentSubCategory,
      'name': model.serviceName,
      'phoneNumber': model.phoneNumber,
      'imageUrl': model.imageUrl,
      'whatsappNumber': model.whatsappNumber,
      'description': model.description,
    };
  }
}
