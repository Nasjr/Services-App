import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:get/get.dart';

class ServicesContorller extends GetxController {
  ServicesContorller(String this.parentname);
  String parentname;
  static ServicesContorller get instance => Get.find();
  List<ServicesModel> services = [];
  var datasrc = [
    {
      "parentName": "Italian Restaurants",
      "name": "La Trattoria",
      "description": "Authentic Italian cuisine in a cozy atmosphere.",
      "phoneNumber": "+1-555-1234",
      "whatsappNumber": "+1-555-5678"
    },
    {
      "parentName": "Italian Restaurants",
      "name": "Ristorante Romano",
      "description": "Fine dining Italian restaurant with a modern twist.",
      "phoneNumber": "+1-555-4321",
      "whatsappNumber": "+1-555-8765"
    },
    {
      "parentName": "Asian Restaurants",
      "name": "Sakura Sushi",
      "description": "Fresh and delicious sushi and Japanese dishes.",
      "phoneNumber": "+1-555-1111",
      "whatsappNumber": "+1-555-2222"
    },
    {
      "parentName": "Asian Restaurants",
      "name": "Spice Garden",
      "description": "Exquisite Asian fusion cuisine with a touch of spice.",
      "phoneNumber": "+1-555-3333",
      "whatsappNumber": "+1-555-4444"
    },
    {
      "parentName": "French Bakeries",
      "name": "Le Petit Pâtissier",
      "description": "Delightful French pastries and freshly baked bread.",
      "phoneNumber": "+1-555-7777",
      "whatsappNumber": "+1-555-8888"
    },
    {
      "parentName": "French Bakeries",
      "name": "Boulangerie Belle",
      "description":
          "Artisanal bakery with a wide selection of French delights.",
      "phoneNumber": "+1-555-9999",
      "whatsappNumber": "+1-555-0000"
    },
    {
      "parentName": "Artisan Bakeries",
      "name": "The Rustic Oven",
      "description": "Handcrafted bread and pastries made with love.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Artisan Bakeries",
      "name": "Bread & Butter",
      "description": "Traditional and artisanal bakery with a modern twist.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "Coffee Shops",
      "name": "Café Mornings",
      "description": "Cozy coffee shop serving freshly brewed beverages.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Coffee Shops",
      "name": "Espresso Junction",
      "description":
          "A trendy coffee spot offering a variety of espresso drinks.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "Organic Markets",
      "name": "Green Fields Market",
      "description": "Organic produce and groceries for a healthy lifestyle.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Organic Markets",
      "name": "Harvest Haven",
      "description": "A one-stop-shop for all your organic needs.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "International Grocers",
      "name": "Global Foods",
      "description": "A diverse selection of international food products.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "International Grocers",
      "name": "World Market",
      "description": "Bringing the flavors of the world to your doorstep.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "24-Hour Pharmacies",
      "name": "Quick Pharmacy",
      "description":
          "Convenient 24-hour pharmacy with a wide range of medications.",
      "phoneNumber": "+1-555-222",
      "whatsappNumber": "+1-555-222"
    },
    {
      "parentName": "Italian Restaurants",
      "name": "La Trattoria",
      "description": "Authentic Italian cuisine in a cozy atmosphere.",
      "phoneNumber": "+1-555-1234",
      "whatsappNumber": "+1-555-5678"
    },
    {
      "parentName": "Italian Restaurants",
      "name": "Ristorante Romano",
      "description": "Fine dining Italian restaurant with a modern twist.",
      "phoneNumber": "+1-555-4321",
      "whatsappNumber": "+1-555-8765"
    },
    {
      "parentName": "Asian Restaurants",
      "name": "Sakura Sushi",
      "description": "Fresh and delicious sushi and Japanese dishes.",
      "phoneNumber": "+1-555-1111",
      "whatsappNumber": "+1-555-2222"
    },
    {
      "parentName": "Asian Restaurants",
      "name": "Spice Garden",
      "description": "Exquisite Asian fusion cuisine with a touch of spice.",
      "phoneNumber": "+1-555-3333",
      "whatsappNumber": "+1-555-4444"
    },
    {
      "parentName": "French Bakeries",
      "name": "Le Petit Pâtissier",
      "description": "Delightful French pastries and freshly baked bread.",
      "phoneNumber": "+1-555-7777",
      "whatsappNumber": "+1-555-8888"
    },
    {
      "parentName": "French Bakeries",
      "name": "Boulangerie Belle",
      "description":
          "Artisanal bakery with a wide selection of French delights.",
      "phoneNumber": "+1-555-9999",
      "whatsappNumber": "+1-555-0000"
    },
    {
      "parentName": "Artisan Bakeries",
      "name": "The Rustic Oven",
      "description": "Handcrafted bread and pastries made with love.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Artisan Bakeries",
      "name": "Bread & Butter",
      "description": "Traditional and artisanal bakery with a modern twist.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "Coffee Shops",
      "name": "Café Eve",
      "description": "Cozy coffee shop serving freshly brewed beverages.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Coffee Shops",
      "name": "Espresso Fun",
      "description":
          "A trendy coffee spot offering a variety of espresso drinks.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "Organic Markets",
      "name": "Green Fields Market",
      "description": "Organic produce and groceries for a healthy lifestyle.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Organic Markets",
      "name": "Harvest Haven",
      "description": "A one-stop-shop for all your organic needs.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "International Grocers",
      "name": "Global Foods",
      "description": "A diverse selection of international food products.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "International Grocers",
      "name": "World Market",
      "description": "Bringing the flavors of the world to your doorstep.",
      "phoneNumber": "+1-555-9876",
      "whatsappNumber": "+1-555-5432"
    },
    {
      "parentName": "24-Hour Pharmacies",
      "name": "Slow Pharmacy",
      "description":
          "Convenient 24-hour pharmacy with a wide range of medications.",
      "phoneNumber": "+1-555-2468",
      "whatsappNumber": "+1-555-1357"
    },
    {
      "parentName": "Compounding Pharmacies",
      "name": "Gardenia Pharmacy",
      "description":
          "Gardenia 24-hour pharmacy with a wide range of medications.",
      "phoneNumber": "+1-523-2463",
      "whatsappNumber": "+1-555-1353"
    },
  ];
  List<ServicesModel> convertedList = [];

  void convertJosntoModel() {
    print(parentname);
    convertedList = datasrc.map((json) {
      return ServicesModel.fromJson(json);
    }).toList();
    print(convertedList);
  }

  @override
  void onInit() {
    convertJosntoModel();
    filterDataSrc(parentname);
    super.onInit();
  }

  void filterDataSrc(String parentName) {
    services = convertedList
        .where((service) =>
            service.parentSubCategory.toLowerCase() == parentName.toLowerCase())
        .toList();
  }
}
