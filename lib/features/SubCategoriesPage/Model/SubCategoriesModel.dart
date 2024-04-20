class SubCategoriesModel {
  String parentName;
  String name;
  String imageUrl;

  SubCategoriesModel({
    required this.parentName,
    required this.name,
    required this.imageUrl,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      parentName: json['parent_name'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parent_name'] = this.parentName;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
