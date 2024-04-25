import 'package:get/get.dart';

import '../Model/SubCategoriesModel.dart';

class SubCategoriesController extends GetxController {
  SubCategoriesController(this.title);

  String title;
  static SubCategoriesController get instace => Get.find();
  List<SubCategoriesModel> subCategoriesModelList = [];

  List<SubCategoriesModel> currSubCategory = [];
  var jsonList = [
    {
      "parent_name": "Restaurants",
      "name": "Italian Restaurants",
      "imageUrl":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Restaurants",
      "name": "Asian Restaurants",
      "imageUrl":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Bakeries",
      "name": "French Bakeries",
      "imageUrl":
          "https://th.bing.com/th/id/OIP.UQelnFFX7vihRqgND4YzUQHaGV?rs=1&pid=ImgDetMain"
    },
    {
      "parent_name": "Bakeries",
      "name": "Artisan Bakeries",
      "imageUrl":
          "https://th.bing.com/th/id/OIP.UQelnFFX7vihRqgND4YzUQHaGV?rs=1&pid=ImgDetMain"
    },
    {
      "parent_name": "Cafes",
      "name": "Coffee Shops",
      "imageUrl":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Cafes",
      "name": "Tea Houses",
      "imageUrl":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Grocery Stores",
      "name": "Organic Markets",
      "imageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Grocery Stores",
      "name": "International Grocers",
      "imageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Pharmacies",
      "name": "24-Hour Pharmacies",
      "imageUrl":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Pharmacies",
      "name": "Compounding Pharmacies",
      "imageUrl":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Gyms & Fitness",
      "name": "Yoga Studios",
      "imageUrl":
          "https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Gyms & Fitness",
      "name": "CrossFit Gyms",
      "imageUrl":
          "https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "parent_name": "Gas Stations",
      "name": "Full Service Gas Stations",
      "imageUrl":
          "https://th.bing.com/th/id/R.33d2bd74f89702eb44df6b55869d4ee0?rik=UJzCDuPKmO5zYw&riu=http%3a%2f%2fwww.secanopies.com%2fwp-content%2fuploads%2f2018%2f07%2fCB-Shell.jpg&ehk=B2Q8QLbEHwuZONWlSc1ieZKJv6x0lUKFVOwjNU8KGHs%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "parent_name": "Gas Stations",
      "name": "Self-Service Gas Stations",
      "imageUrl":
          "https://th.bing.com/th/id/R.33d2bd74f89702eb44df6b55869d4ee0?rik=UJzCDuPKmO5zYw&riu=http%3a%2f%2fwww.secanopies.com%2fwp-content%2fuploads%2f2018%2f07%2fCB-Shell"
    }
  ];
  void convertJosntoModel() {
    subCategoriesModelList =
        jsonList.map((json) => SubCategoriesModel.fromJson(json)).toList();
  }

  void filterByParentCategory(String Category) async {
    print("Category Name is $Category");
    currSubCategory = subCategoriesModelList
        .where((element) =>
            element.parentName.toLowerCase() == Category.toLowerCase())
        .toList();
    update();
  }

  @override
  void onInit() async {
    
    filterByParentCategory(title);

    super.onInit();
  }
}
