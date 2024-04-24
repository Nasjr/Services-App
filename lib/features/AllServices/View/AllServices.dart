import 'package:ecommerce_application/common/widgets/CustomAppBar/CustomAppBar.dart';
import 'package:ecommerce_application/features/Home/View/NavigationView.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllServices extends StatelessWidget {
  const AllServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'All Services',
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0.h),
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 227, 227),
                  borderRadius: BorderRadius.circular(20.w)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(child: Image.asset(MImages.user)),
                  SizedBox(
                    width: 20.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notification Title'),
                      Text('Descreption Notification'),
                    ],
                  )
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 10.h,
            ),
            itemCount: 12,
          ),
        ));
  }
}
