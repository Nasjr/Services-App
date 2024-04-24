
import 'package:ecommerce_application/common/widgets/CustomDropDown/CustomDropDown.dart';
import 'package:ecommerce_application/common/widgets/NotificationWidget/NotificationWidget.dart';
import 'package:ecommerce_application/features/Home/Controller/MainScreenController.dart';
import 'package:ecommerce_application/features/Settings/View/Settings.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/image_strings.dart';
import '../CustomSearchWidget/CustomSearchWidget.dart';

class CustomMainHeader extends StatelessWidget {
  const CustomMainHeader({
    super.key,
    this.isHomeScreen = true,
  });
  final bool isHomeScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
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
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w))),
      padding:
          EdgeInsets.only(top: 15.h, bottom: 10.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<MainScreenController>(builder: (cont) {
            return isHomeScreen
                ? Row(
                    children: [
                      CustomDropDown(
                          value: cont.currZone,
                          items: cont.zones.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                '$value',
                                style: TextStyle(
                                    fontSize: 10.sp, color: MColors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (zone) => cont.onZoneChanged(zone)),
                      const Spacer(),
                      NotificationsWidget(),
                      IconButton(
                        onPressed: () => Get.to(() => SettingsPage()),
                        icon: Icon(
                          Icons.settings,
                          size: 25.w,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          S.current.Settings,
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.sp),
                        )),
                        Padding(
                          padding: EdgeInsets.all(10.0.w),
                          child: CircleAvatar(
                            radius: 40.w,
                            child: Image.asset(
                              MImages.user,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          'UserId: 34948456578346',
                          style: TextStyle(
                              color: MColors.light,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
          }),
          if (isHomeScreen) SearchWidget()
        ],
      ),
    );
  }
}
