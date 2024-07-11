import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppTheme {
  static const DarkColors _darkColors = DarkColors();
  static const LightColors _lightColors = LightColors();

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: _darkColors.primaryBg,
    appBarTheme: _getAppBarTheme(_darkColors),
    textTheme: _getTextTheme(_darkColors),
    inputDecorationTheme: _getInputDecorationTheme(_darkColors),
    bottomNavigationBarTheme: _getBottomNavigationBarTheme(_darkColors),
    primaryColor: _darkColors.primaryBg,
    brightness: Brightness.dark,
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
    ),
    scaffoldBackgroundColor: _lightColors.primaryBg,
    appBarTheme: _getAppBarTheme(_lightColors),
    textTheme: _getTextTheme(_lightColors),
    inputDecorationTheme: _getInputDecorationTheme(_lightColors),
    bottomNavigationBarTheme: _getBottomNavigationBarTheme(_lightColors),
    primaryColor: _lightColors.primaryBg,
  );

  static AppBarTheme _getAppBarTheme(AppColors colors) {
    return AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: colors.basicGreen,
      ),
    );
  }

  static TextTheme _getTextTheme(AppColors colors) {
    return const TextTheme(titleLarge: TextStyle()).apply(
      bodyColor: colors.basicWhite,
      displayColor: colors.basicWhite,
    );
  }

  static InputDecorationTheme _getInputDecorationTheme(AppColors colors) {
    return InputDecorationTheme(
      errorStyle: AppFonts.playfairDisplay.copyWith(
        fontSize: 0,
        color: Colors.transparent,
      ),
      suffixIconColor: colors.basicGreen,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    );
  }

  static BottomNavigationBarThemeData _getBottomNavigationBarTheme(AppColors colors) {
    return BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.primaryBg,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    );
  }
}
