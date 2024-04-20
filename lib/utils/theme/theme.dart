import 'package:ecommerce_application/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ecommerce_application/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class MAppTheme {
  MAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: MTextTheme.lighTextTheme,
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      chipTheme: MChipTheme.lighChipTheme,
      appBarTheme: MAppBarTheme.lightAppBarTheme,
      checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
      elevatedButtonTheme: MElevatedButtonTheme.lighElevatedButtonTheme,
      outlinedButtonTheme: MOutlinedButtonTheme.lighOutlinedButtonTheme,
      inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: MTextTheme.darkTextTheme,
      iconTheme: const IconThemeData(color: Colors.black, size: 30),
      chipTheme: MChipTheme.darkChipTheme,
      appBarTheme: MAppBarTheme.darkAppBarTheme,
      checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
      elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme);
}
