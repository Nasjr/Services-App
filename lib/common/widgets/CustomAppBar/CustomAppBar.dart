import 'package:ecommerce_application/utils/device/device_utility.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
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
                colors: MHelperFunctions.isDarkMode(context)
                    ? [
                        Color.fromARGB(255, 0, 0, 0),
                        Color.fromARGB(255, 77, 77, 77),
                      ]
                    : [
                        Color.fromARGB(255, 3, 136, 59),
                        Color.fromARGB(255, 4, 180, 92).withOpacity(0.9),
                      ],
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: title.length > 20 ? 12.sp : 22.0.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            )));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MDeviceUtils.getAppBarHeight().h);
}
