import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/app_button.dart';
import '../../../core_ui/widgets/app_image.dart';
import '../bloc/home_bloc.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.of(context).primaryBg,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppButton(
                  onPressed: () {},
                  borderRadius: AppDimens.borderRadius24,
                  prefixWidget: const AppImage(
                    image: AppImages.refreshIcon,
                    width: 24,
                    height: 24,
                  ),
                  buttonText: LocaleKeys.buttons_new_calculate.tr(),
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: AppDimens.padding40.w,
                ),
                SizedBox(width: AppDimens.padding18.w),
                AppButton(
                  onPressed: () {},
                  type: AppButtonType.white,
                  borderRadius: AppDimens.borderRadius24,
                  prefixWidget: AppImage(
                    image: AppImages.calculatorIcon,
                    color: AppColors.of(context).basicBlue,
                    width: 24,
                    height: 24,
                  ),
                  buttonText: LocaleKeys.buttons_calculate.tr(),
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: AppDimens.padding40.w,
                ),
                SizedBox(width: AppDimens.padding18.w),
                AppButton(
                  onPressed: () {},
                  type: AppButtonType.secondaryGreen,
                  borderRadius: AppDimens.borderRadius24,
                  prefixWidget: const AppImage(
                    image: AppImages.settingsIcon,
                    width: 24,
                    height: 24,
                  ),
                  buttonText: '',
                  verticalPadding: AppDimens.padding20.h,
                  horizontalPadding: AppDimens.padding20.w,
                ),
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: AppDimens.size100.h),
              const Placeholder(),
            ],
          ),
        );
      },
    );
  }
}
