import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 60.0),
        child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0E3EDA).withOpacity(0.9),
                  const Color.fromARGB(255, 66, 177, 236),
                ],
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 12.0, bottom: 12.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight().h);
}
