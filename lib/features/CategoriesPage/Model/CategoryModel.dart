import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? name;
  final String? imageUrl;
  final String? nameAR;
  final int? zone;
  final bool? isFeatured;
  final Timestamp? updateDate;
  CategoryModel(
      {this.nameAR,
      this.zone,
      this.isFeatured,
      this.updateDate,
      required this.name,
      required this.imageUrl});

  // From JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        name: json['name'],
        imageUrl: json['imageUrl'],
        nameAR: json['nameAR'],
        zone: json['zone'],
        isFeatured: json['isFeatured'] ?? false,
        updateDate: json['updateDate'] ?? Timestamp.now());
  }

  // From DocSnapshot
  factory CategoryModel.mapFirestoreToCategoryModel(DocumentSnapshot doc) {
    // Get data from the document
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Extract and handle missing fields with default values
    return CategoryModel(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      nameAR: data['nameAR'] ?? '',
      zone: data['zone'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      updateDate: data['updateDate'] ?? Timestamp.now(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'nameAR': nameAR,
      'zone': zone,
      'isFeatured': isFeatured,
      'updateDate': updateDate,
    };
  }
}
