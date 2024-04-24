import 'package:ecommerce_application/features/Home/View/Widgets/MainPage.dart';
import 'package:ecommerce_application/features/Settings/Controller/SettingsController.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/helpers/helper_functions.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

import '../../../common/widgets/CustomHeader/CustomHeader.dart';

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(body: GetBuilder<SettingsController>(builder: (contr) {
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
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
                child: Column(
                  children: [
                    SettingsWidget(
                      title: Text(
                        S.current.ChangLang,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      traling: MaterialButton(
                        onPressed: () {
                          contr.switchLanguage();
                        },
                        child: Text(AppLocalStorage()
                            .readData(LocalDataSourceKeys.localization)),
                      ),
                    ),
                    SettingsWidget(
                      title: Text(
                        S.current.ChangeTheme,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      traling: MaterialButton(
                        onPressed: () {
                          print(AppLocalStorage()
                              .readData(LocalDataSourceKeys.theme));
                          contr.switchTheme();
                        },
                        child: Text(AppLocalStorage()
                            .readData(LocalDataSourceKeys.theme)),
                      ),
                    ),
                    SettingsWidget(
                      title: Text(
                        S.current.UploadCat,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      traling: MaterialButton(
                        onPressed: () {},
                        child: Text('Upload'),
                      ),
                    ),
                    SettingsWidget(
                      title: Text(
                        S.current.UploadSubCat,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      traling: MaterialButton(
                        onPressed: () {},
                        child: Text('Upload'),
                      ),
                    ),
                    SettingsWidget(
                      title: Text(
                        S.current.UploadService,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      traling: MaterialButton(
                        onPressed: () {},
                        child: Text('Upload'),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );
    }));
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
