import 'package:flutter/material.dart';

import '../../core/core_export.dart';

class AppFonts {
  static const String kPlayfairDisplayFontFamily = 'PlayfairDisplay';

  ///SFProRounded font style
  static TextStyle get playfairDisplay => const TextStyle(
        fontFamily: kPlayfairDisplayFontFamily,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get baseFont16 => TextStyle(
        fontFamily: kPlayfairDisplayFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16.0.sp,
      );
}
