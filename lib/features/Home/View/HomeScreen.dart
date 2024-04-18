import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_city),
                Text("Zone 1"),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              ],
            ),
            Text('Home Page')
          ],
        ),
      ),
    );
  }
}
