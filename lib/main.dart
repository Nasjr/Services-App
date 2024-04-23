import 'package:ecommerce_application/features/authentication/AuthRepository/AuthRepository.dart';
import 'package:ecommerce_application/features/authentication/splashScreen/splashScreen.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Todo: add Widgits Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Init Local Storage
  await Hive.initFlutter();
  await Hive.openBox(LocalDataSourceBoxs.configBox);
  // Remove the defult splash Screen
  FlutterNativeSplash.remove();
  // Todo: Initialize Firebase

  // Todo: Initialize Authentication
  await Future.delayed(Durations.short1)
      .then((value) => Get.put(AuthenticationRepository()));
  // Initialize UI Setup and colors

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 0, 0, 0)));
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale('ar'),
            // customize themes
            themeMode: ThemeMode.system,
            theme: MAppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            darkTheme: MAppTheme.darkTheme,
            home: Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            )));
      },
    );
  }
}
