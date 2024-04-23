import 'package:ecommerce_application/features/Home/View/Widgets/MainPage.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  List<Widget> changeList = [
    SettingsWidget(
      title: Text(
        "Change Language",
        style: TextStyle(fontSize: 12.sp),
      ),
      traling: MaterialButton(
        onPressed: () {},
        child: Text('EN'),
      ),
    ),
    SettingsWidget(
      title: Text(
        "Change Theme",
        style: TextStyle(fontSize: 12.sp),
      ),
      traling: MaterialButton(
        onPressed: () {},
        child: Text('Light'),
      ),
    ),
    SettingsWidget(
      title: Text(
        "Upload Categories",
        style: TextStyle(fontSize: 12.sp),
      ),
      traling: MaterialButton(
        onPressed: () {},
        child: Text('Upload'),
      ),
    ),
    SettingsWidget(
      title: Text(
        "Upload SubCategories",
        style: TextStyle(fontSize: 12.sp),
      ),
      traling: MaterialButton(
        onPressed: () {},
        child: Text('Upload'),
      ),
    ),
    SettingsWidget(
      title: Text(
        "Upload Services",
        style: TextStyle(fontSize: 12.sp),
      ),
      traling: MaterialButton(
        onPressed: () {},
        child: Text('Upload'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
            child: Center(
                child: Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            )),
            height: 80.h,
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
            )),
        CustomMainHeader(
          isHomeScreen: false,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.all(4.0).h,
          child: Container(
            height: 500.h,
            child: ListView.builder(
                itemCount: changeList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => changeList[index]),
          ),
        )
      ],
    ));
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.title,
    this.traling,
  });
  final Widget? title;
  final Widget? traling;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: traling,
    );
  }
}
