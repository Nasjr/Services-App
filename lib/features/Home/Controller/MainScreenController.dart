import 'package:ecommerce_application/features/Home/model/CategoryModel.dart';
import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController {
  static MainScreenController get instance => Get.find();
  int currIndex = 0;
  late String currZone;
  List<String> zones = [];
  List<String> banners = [MImages.banner5, MImages.banner8, MImages.banner6];
  final List<ServicesModel> servicesList = [
    ServicesModel(
      parentName: "Handyman Services",
      name: "John's Plumbing",
      phoneNumber: "+1 (555) 555-1234",
      whatsappNumber: "+1 (555) 555-5678",
      description:
          "Reliable and experienced plumber for all your residential and commercial needs. 24/7 emergency service available.",
      imagePath: "https://icons8.com/icons/set/plumber",
    ),
    ServicesModel(
      parentName: "Pet Care",
      name: "Happy Paws Walkers",
      phoneNumber: "+1 (555) 123-4567",
      whatsappNumber: "", // Empty string for unavailable whatsapp
      description:
          "We provide loving and reliable dog walking services tailored to your pet's needs. Insured and bonded.",
      imagePath: "https://icons8.com/icons/set/dog-walker",
    ),
    ServicesModel(
      parentName: "Handyman Services",
      name: "Creative Spark Studios",
      phoneNumber: "+1 (555) 789-0123",
      whatsappNumber: "", // Empty string for unavailable whatsapp
      description:
          "We create stunning and user-friendly websites that help your business thrive online. Free consultations!",
      imagePath: "https://icons8.com/icons/set/web-design",
    ),
    ServicesModel(
      parentName: "Fitness & Wellness",
      name: "Maria's Yoga Flow",
      phoneNumber: "+1 (555) 345-6789",
      whatsappNumber: "+1 (555) 345-9876",
      description:
          "Experienced yoga instructor offering group classes and private sessions for all levels. Find your inner peace with us!",
      imagePath: "https://icons8.com/icons/set/yoga",
    ),
    ServicesModel(
      parentName: "Food & Beverages",
      name: "Delicious Delights Catering",
      phoneNumber: "+1 (555) 901-2345",
      whatsappNumber: "", // Empty string for unavailable whatsapp
      description:
          "We cater events of all sizes with fresh, delicious, and beautifully presented food. Let us take care of the food so you can enjoy the party!",
      imagePath: "https://icons8.com/icons/set/food-and-wine",
    ),
  ];
  @override
  void onInit() {
    mapCategories();
    currZone = S.current.SelectedZoneAll;
    initializeZonesList();
    super.onInit();
  }

  void initializeZonesList() {
    print('Hereeee');
    zones = AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar'
        ? ["كل المناطق", "المنطقة واحد", "المنطقة اثنين", "المنطقة ثلاثة"]
        : [
            'SelectedZone (All)',
            'SelectedZone (One)',
            'SelectedZone (Two)',
            'SelectedZone (Three)'
          ];
    currZone = zones[0];
  }

  final categories = [
    {
      "name": "Restaurants",
      "imageUrl":
          "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Bakeries",
      "imageUrl":
          "https://th.bing.com/th/id/OIP.UQelnFFX7vihRqgND4YzUQHaGV?rs=1&pid=ImgDetMain"
    },
    {
      "name": "Cafes",
      "imageUrl":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Grocery Stores",
      "imageUrl":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Pharmacies",
      "imageUrl":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Gyms & Fitness",
      "imageUrl":
          "https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },
    {
      "name": "Gas Stations",
      "imageUrl":
          "https://th.bing.com/th/id/R.33d2bd74f89702eb44df6b55869d4ee0?rik=UJzCDuPKmO5zYw&riu=http%3a%2f%2fwww.secanopies.com%2fwp-content%2fuploads%2f2018%2f07%2fCB-Shell.jpg&ehk=B2Q8QLbEHwuZONWlSc1ieZKJv6x0lUKFVOwjNU8KGHs%3d&risl=&pid=ImgRaw&r=0"
    },
    {
      "name": "Salons",
      "imageUrl":
          "https://i.pinimg.com/originals/1f/07/30/1f0730df29a4bf396412755530ab4e4c.jpg"
    },
    {
      "name": "Laundry",
      "imageUrl":
          "https://th.bing.com/th/id/R.03332ec9e8b34c0e4fea59e1674b9b1b?rik=HZu%2b3uGtCYbmDQ&pid=ImgRaw&r=0"
    },
    {
      "name": "Dry Cleaners",
      "imageUrl":
          "https://jla.com/wp-content/uploads/2021/04/LaundryHygiene800x800.jpg"
    }
  ];
  List<CategoryModel> categoryList = [];

  void mapCategories() {
    categoryList =
        categories.map((item) => CategoryModel.fromJson(item)).toList();
  }

  void onZoneChanged(String? zone) {
    currZone = zone!;
    AppLocalStorage().saveData("Zone", currZone);
    update();
  }

  void onPageChanged(int index) {
    currIndex = index;
    update(['CrouselBuilder']);
  }

  onTapCarousel(int index) {
    print(index);
  }
}
