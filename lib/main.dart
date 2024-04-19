import 'package:ecommerce_application/features/authentication/Onboarding/views/onboarding.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Todo: add Widgits Binding
  WidgetsFlutterBinding.ensureInitialized();
  // Todo: Init Local Storage
  await Hive.initFlutter();
  await Hive.openBox(LocalDataSourceBoxs.configBox);
  // Todo: Await Native Splash
  // Todo: Initialize Firebase
  // Todo: Initialize Authentication
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          // customize themes
          themeMode: ThemeMode.system,
          theme: MAppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: MAppTheme.darkTheme,
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
