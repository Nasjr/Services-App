import 'package:ecommerce_application/features/Home/View/HomeScreen.dart';
import 'package:ecommerce_application/features/authentication/AuthRepository/AuthRepository.dart';
import 'package:ecommerce_application/features/authentication/Onboarding/views/onboarding.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:ecommerce_application/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Todo: add Widgits Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Todo: Init Local Storage
  await Hive.initFlutter();
  await Hive.openBox(LocalDataSourceBoxs.configBox);
  // Check for the first launch

  // Todo: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize Firebase
  await Future.delayed(Durations.long3)
      .then((value) => Get.put(AuthenticationRepository()));
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
          home: const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
