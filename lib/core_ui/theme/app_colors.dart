import 'package:flutter/material.dart';

import '../../core/di/app_di.dart';
import '../../navigation/app_router/app_router.dart';

abstract class AppColors {
  factory AppColors.ofGlobalContext() {
    final BuildContext? context = appLocator<AppRouter>().navigatorKey.currentContext;
    if (context == null) {
      return const DarkColors();
    }
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  static const Color transparent = Color(0x00000000);

  // Background
  Color get primaryBg;

  Color get secondaryBg;
  Color get tableBg;

  // Basic
  Color get basicWhite;

  Color get basicRed;

  Color get basicGreen;

  Color get basicBlue;

  Color get errorRed;
  Color get textGray;
}

class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get primaryBg => const Color(0xFFE2CAAB);

  @override
  Color get secondaryBg => const Color(0xFFbfa68d);
  Color get tableBg => const Color(0xFFF8ECE1);

  @override
  Color get basicWhite => const Color(0xFFFFFFFF);

  @override
  Color get basicRed => const Color(0xFFd24545);

  @override
  Color get basicGreen => const Color(0xFF2EA65C);

  @override
  Color get basicBlue => const Color(0xFF201C24);

  @override
  Color get errorRed => const Color(0xFFF63030);
  Color get textGray => const Color(0xFF808B7F);
}

class LightColors extends DarkColors {
  const LightColors();
}
