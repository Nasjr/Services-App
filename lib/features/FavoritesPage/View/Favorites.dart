import 'package:ecommerce_application/common/widgets/BrandCard.dart';
import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/CustomAppBar/CustomAppBar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favorites',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 288,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2),
            itemBuilder: (context, index) => ProductCardVertical(
                  imagePath: MImages.productImage19,
                  title: 'AlShabrawy Resturant',
                )),
      ),
    );
  }
}
