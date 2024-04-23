import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../features/NotificationsPage/View/NotificationsPage.dart';
import '../../../utils/constants/colors.dart';

class NotificationsWidget extends StatelessWidget {
  NotificationsWidget({
    super.key,
    this.isNotificationsAvaialble = false,
  });
  final bool isNotificationsAvaialble;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(NotificationsPage()),
          icon: const Icon(
            Icons.notifications,
            color: MColors.light,
            size: 25,
          ),
        ),
        Positioned(
          right: 9,
          top: 8,
          child: isNotificationsAvaialble
              ? Container(
                  height: 12.h,
                  width: 14.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.w),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      '12',
                      style: TextStyle(fontSize: 6.sp, color: MColors.light),
                    ),
                  ))
              : SizedBox.shrink(),
        )
      ],
    );
  }
}
