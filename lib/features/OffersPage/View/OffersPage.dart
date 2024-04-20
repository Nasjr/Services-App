import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Offers',
      ),
      body: Center(
        child: Text('OffersPage'),
      ),
    );
  }
}
