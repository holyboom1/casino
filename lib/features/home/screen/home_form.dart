import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/app_button.dart';
import '../../../core_ui/widgets/app_image.dart';
import '../../../core_ui/widgets/roulette_table.dart';
import '../bloc/home_bloc.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.of(context).primaryBg,
            toolbarHeight: 110.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppButton(
                  onPressed: () {
                    appLocator<RouletteCalculator>().clearRouletteFieldBets();
                  },
                  borderRadius: AppDimens.borderRadius12,
                  prefixWidget: AppImage(
                    image: AppImages.refreshIcon,
                    width: 48.r,
                    height: 48.r,
                  ),
                  buttonText: LocaleKeys.buttons_new_calculate.tr(),
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: 60.w,
                ),
                SizedBox(width: AppDimens.padding18.w),
                AppButton(
                  onPressed: () {
                    appLocator<AppRouter>().router.push(RouterConstants.selectNumbersRoute);
                  },
                  type: AppButtonType.white,
                  borderRadius: AppDimens.borderRadius12,
                  prefixWidget: AppImage(
                    image: AppImages.calculatorIcon,
                    color: AppColors.of(context).basicBlue,
                    width: 48.r,
                    height: 48.r,
                  ),
                  buttonText: LocaleKeys.buttons_calculate.tr(),
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: 60.w,
                ),
                SizedBox(width: AppDimens.padding18.w),
                AppButton(
                  onPressed: () {
                    appLocator<AppRouter>().router.push(RouterConstants.settingsRoute);
                  },
                  type: AppButtonType.secondaryGreen,
                  borderRadius: AppDimens.borderRadius12,
                  prefixWidget: AppImage(
                    image: AppImages.settingsIcon,
                    width: 48.r,
                    height: 48.r,
                  ),
                  buttonText: '',
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: AppDimens.padding20.w,
                ),
              ],
            ),
          ),
          body: RouletteTable(
            onPressed: (RouletteCellModel number) {
              appLocator<AppRouter>().router.push(
                    RouterConstants.calculatorTableRoute,
                    extra: number,
                  );
            },
          ),
        );
      },
    );
  }
}
