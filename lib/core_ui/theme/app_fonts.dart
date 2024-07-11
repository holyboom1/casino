import 'package:flutter/material.dart';

import '../../core/core_export.dart';

class AppFonts {
  static const String kPlayfairDisplayFontFamily = 'PlayfairDisplay';
  static const String kInterFamily = 'Inter';

  ///SFProRounded font style
  static TextStyle get playfairDisplay => const TextStyle(
        // fontFamily: kPlayfairDisplayFontFamily,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get baseFont16 => TextStyle(
        fontFamily: kPlayfairDisplayFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16.0.sp,
      );

  ///Inter font style
  static TextStyle get interDisplay => const TextStyle(
        fontFamily: kInterFamily,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get interMedium16 => TextStyle(
        fontFamily: kInterFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16.0.sp,
      );

  static TextStyle get interMedium24 => TextStyle(
        fontFamily: kInterFamily,
        fontWeight: FontWeight.w500,
        fontSize: 24.0.sp,
      );

  static TextStyle get interMedium30 => TextStyle(
        fontFamily: kInterFamily,
        fontWeight: FontWeight.w500,
        fontSize: 30.0.sp,
      );

  static TextStyle get interMedium48 => TextStyle(
        fontFamily: kInterFamily,
        fontWeight: FontWeight.w500,
        fontSize: 48.0.sp,
      );
}
