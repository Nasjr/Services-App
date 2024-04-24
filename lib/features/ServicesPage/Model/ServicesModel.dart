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
  final String parentName;
  final String name;
  final String phoneNumber;
  final String whatsappNumber;
  final String description;
  final String imagePath;

  ServicesModel(
      {required this.parentName,
      required this.name,
      required this.phoneNumber,
      required this.whatsappNumber,
      required this.description,
      required this.imagePath});

  // from JsonConstructor
  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
        parentName: json['parentName'] ?? '',
        name: json['name'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        whatsappNumber: json['whatsappNumber'] ?? '',
        description: json['description'] ?? '',
        imagePath: json['imagePath'] ?? MImages.productImage1);
  }
  // To JsonConstructor
  Map<String, dynamic> toJson(ServicesModel model) {
    return {
      'parentName': model.parentName,
      'name': model.name,
      'phoneNumber': model.phoneNumber,
      'imagePath': model.imagePath,
      'whatsappNumber': model.whatsappNumber,
      'description': model.description,
    };
  }
}
