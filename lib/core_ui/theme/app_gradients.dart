import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class AppGradients {
  static final AppColors _appColors = AppColors.ofGlobalContext();

  static RadialGradient get messageGradient => RadialGradient(
        radius: 3,
        colors: <Color>[
          _appColors.basicGreen.withOpacity(AppDimens.opacity25),
          _appColors.basicBlue.withOpacity(AppDimens.opacity25),
        ],
      );
}
