import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/widgets.dart';
import '../bloc/calculator_result_cubit.dart';

class CalculatorResultForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorResultCubit, CalculatorResultState>(
      builder: (BuildContext context, CalculatorResultState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.common_calculation.tr(),
              style: AppFonts.interMedium30.copyWith(
                color: AppColors.of(context).basicBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
            backgroundColor: AppColors.of(context).primaryBg,
            leading: GestureDetector(
              onTap: () {
                appLocator<AppRouter>().router.pop();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 100.w),
                child: AppImage(
                  image: AppImages.backIcon,
                  color: AppColors.of(context).basicBlue,
                  width: 74.r,
                  height: 74.r,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: AppDimens.size100.h),
                const AppImage(image: AppImages.eclipseIcon),
                SizedBox(height: AppDimens.size72.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 48.h),
                  decoration: BoxDecoration(
                    color: AppColors.of(context).basicWhite,
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            LocaleKeys.common_bet_amount.tr(),
                            style: AppFonts.interMedium48.copyWith(
                              color: AppColors.of(context).basicBlue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: AppDimens.padding10.w),
                          Text(
                            state.betAmount,
                            style: AppFonts.interMedium48.copyWith(
                              color: AppColors.of(context).basicBlue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.size50.h),
                      CalculationResultTile(
                        title: LocaleKeys.common_bet_amount.tr(),
                        value: state.betAmount,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_change.tr(),
                        value: state.change,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_bet_amount_without_change.tr(),
                        value: state.betAmountWithoutChange,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_display_in_num.tr(),
                        value: state.displayInNum,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_display_in_num_forehead.tr(),
                        value: state.displayInNumForehead,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_completion_payment.tr(),
                        value: state.completionPayment,
                      ),
                      Divider(color: AppColors.of(context).basicBlue.withOpacity(0.1)),
                      CalculationResultTile(
                        title: LocaleKeys.common_payment_of_delivered.tr(),
                        value: state.paymentOfDelivered,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppDimens.padding50.h),
                Center(
                  child: AppButton(
                    onPressed: () {
                      appLocator<AppRouter>()
                          .router
                          .pushNamed(RouterConstants.calculatorResultRoute);
                    },
                    borderRadius: AppDimens.borderRadius12,
                    type: AppButtonType.white,
                    prefixWidget: AppImage(
                      image: AppImages.calculatorIcon,
                      width: 48.r,
                      height: 48.r,
                    ),
                    buttonText: LocaleKeys.buttons_new_calculate.tr(),
                    verticalPadding: AppDimens.padding20.h,
                    horizontalPadding: 60.w,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
