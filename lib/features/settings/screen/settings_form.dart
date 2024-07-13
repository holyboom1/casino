import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/widgets.dart';
import '../bloc/settings_cubit.dart';

class SettingsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.of(context).primaryBg,
            title: Text(
              LocaleKeys.common_settings.tr(),
              style: AppFonts.interMedium30.copyWith(
                color: AppColors.of(context).basicBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                appLocator<AppRouter>().router.pop();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 100.w),
                child: AppImage(
                  image: AppImages.backIcon,
                  width: 74.r,
                  height: 74.r,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 48.h),
            child: Column(
              children: <Widget>[
                const Spacer(),
                Center(
                  child: AppImage(
                    image: AppImages.eclipseIcon,
                    width: 522.r,
                    height: 236.r,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.common_complete_type.tr(),
                    style: AppFonts.interMedium30.copyWith(
                      color: AppColors.of(context).basicBlue.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CurrencySwitcher(
                  selectedCurrency: state.currency,
                  onCurrencyChanged: (Currency currency) {
                    context.read<SettingsCubit>().changeCurrency(currency);
                  },
                ),
                SizedBox(height: 48.h),
                CustomDisplayContainer(
                  isFocus: state.maxBetAmount.isNotEmpty,
                  displayText: state.maxBetAmount,
                  title: LocaleKeys.common_max_in_number.tr(),
                ),
                const Spacer(
                  flex: 2,
                ),
                CustomCalculator(
                  isSettingsCalculator: true,
                  onDisplayTextChanged: (String value) {
                    context.read<SettingsCubit>().displayMaxAmount(value);
                  },
                  onDonePressed: (String value) {
                    appLocator<RouletteCalculator>().clearRouletteFieldBets();
                    appLocator<AppRouter>().router.pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
