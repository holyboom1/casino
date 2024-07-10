import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppGradients {
  static final AppColors _appColors = AppColors.ofGlobalContext();

  static LinearGradient get appBarGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          _appColors.gradientBlack.withOpacity(AppDimens.opacity015),
          _appColors.gradientGreen1.withOpacity(AppDimens.opacity015),
        ],
      );

  static LinearGradient get onBoardingCompleteGradient => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          _appColors.background.withOpacity(AppDimens.opacity3),
          _appColors.gradientGreen3.withOpacity(AppDimens.opacity3),
          _appColors.gradientGreen2.withOpacity(AppDimens.opacity3),
        ],
        stops: const <double>[0.0, 0.65, 0.8],
      );

  static RadialGradient get messageGradient => RadialGradient(
        radius: 3,
        colors: <Color>[
          _appColors.basicGreen.withOpacity(AppDimens.opacity25),
          _appColors.basicBlack.withOpacity(AppDimens.opacity25),
        ],
      );
}
