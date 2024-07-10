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

  // Background
  Color get background;

  // Basic
  Color get basicWhite;
  Color get basicGrey;
  Color get basicGreen;
  Color get basicBlack;

  // Gradient
  Color get gradientBlack;
  Color get gradientGreen1;
  Color get gradientGreen2;
  Color get gradientGreen3;
  Color get gradientGreen4;
  Color get gradientGreenOrange1;
  Color get gradientGreenOrange2;

  // Stroke
  Color get strokeWhite;
  Color get strokeGreen;
  Color get strokeGrey;
  Color get errorRed;
}

class DarkColors implements AppColors {
  const DarkColors();

  @override
  Color get background => const Color(0xFF181818);

  @override
  Color get basicWhite => const Color(0xFFFFFFFF);

  @override
  Color get basicGrey => const Color(0xFF969696);

  @override
  Color get basicGreen => const Color(0xFF30D9BA);

  @override
  Color get basicBlack => const Color(0xFF202020);

  @override
  Color get gradientBlack => const Color(0x80181818);

  @override
  Color get gradientGreen1 => const Color(0xFF30D9BA);

  @override
  Color get gradientGreen2 => const Color(0x00197363);

  @override
  Color get gradientGreen3 => const Color(0xFF00FFD0);

  @override
  Color get gradientGreen4 => const Color(0xFF1C3D37);

  @override
  Color get gradientGreenOrange1 => const Color(0xFF30D9BA);

  @override
  Color get gradientGreenOrange2 => const Color(0xFFFF5C00);

  @override
  Color get strokeWhite => const Color(0x33FFFFFF);

  @override
  Color get strokeGreen => const Color(0x1A30D9BA);

  @override
  Color get strokeGrey => const Color(0x33393939);

  @override
  Color get errorRed => const Color(0xFFF04438);
}

class LightColors extends DarkColors {
  const LightColors();
}
