import 'package:ecommerce_application/features/Home/View/NavigationView.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/Home/View/Widgets/CustomSearchDelegate/CustomSearchDelegate.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: CustomSearch());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 45.h,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.search,
              size: 25.w,
              color: Colors.grey,
            ),
            SizedBox(
              width: 40.w,
            ),
            Text(
              S.current.SearchText,
              style: TextStyle(color: MColors.darkGrey, fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }
}
