class CategoryModel {
  String name;
  String imageUrl;

  CategoryModel({required this.name, required this.imageUrl});

  // From JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'], 
      imageUrl: json['imageUrl']
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl
    };
  }
}