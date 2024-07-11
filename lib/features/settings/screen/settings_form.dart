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
            toolbarHeight: 70,
            backgroundColor: AppColors.of(context).primaryBg,
            leadingWidth: 60,
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
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: AppImage(image: AppImages.backIcon),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Column(
              children: <Widget>[
                SizedBox(height: AppDimens.size100.h),
                const Center(child: AppImage(image: AppImages.eclipseIcon)),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.common_complete_type.tr(),
                    style: AppFonts.interMedium30.copyWith(
                      color: AppColors.of(context).basicBlue.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                CurrencySwitcher(),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).secondaryBg,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.common_comp_amount.tr(),
                      style: AppFonts.interMedium30.copyWith(
                        color: AppColors.of(context).basicBlue.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const CustomCalculator(isSettingsCalculator: true),
              ],
            ),
          ),
        );
      },
    );
  }
}
