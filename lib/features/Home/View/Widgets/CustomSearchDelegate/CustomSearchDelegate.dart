import 'package:ecommerce_application/features/ServiceProviderPage/View/ServiceProviderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../ServicesPage/Model/ServicesModel.dart';

class CustomSearch extends SearchDelegate {
  List<String> suggestions = [
    'Shabrawy',
    'Al Wafaa Football',
    'Al Amal clinic',
    'Circle K'
  ];
  List<String> filterlist = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: filterlist.length,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(10.w),
        child: Text(
          filterlist[index],
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filterlist = suggestions
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filterlist.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: GestureDetector(
          onTap: () {
            print(filterlist[index]);
            Get.to(() => ServiceProviderPage(
                servicePorvider: ServicesModel(
                    parentName: 'parentCategory',
                    name: '${filterlist[index]}',
                    phoneNumber: '01153453880',
                    whatsappNumber: '01153453880',
                    description:
                        'description description description description description',
                    imagePath: '')));
          },
          child: Card(
            color: MColors.lightContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                filterlist[index],
                style: TextStyle(fontSize: 12.w, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
