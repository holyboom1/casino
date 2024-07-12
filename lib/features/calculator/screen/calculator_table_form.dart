import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/widgets.dart';
import '../bloc/calculator_table_cubit.dart';

class CalculatorTableForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorTableCubit, CalculatorTableState>(
      builder: (BuildContext context, CalculatorTableState state) {
        final bool isFocus = state.displayText.isNotEmpty;
        if (state.rouletteCalculator == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.of(context).primaryBg,
            title: Text(
              LocaleKeys.common_indicate_the_rate.tr(),
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
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: AppDimens.size100.h),
                Center(
                  child: RouletteSector(
                    number: state.number.number.toString(),
                    color: state.number.color,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomDisplayContainer(
                  isFocus: isFocus,
                  displayText: state.displayText,
                ),
                SizedBox(height: 30.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20).h,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    LocaleKeys.common_bet_amount.tr(),
                    style: AppFonts.interMedium30.copyWith(
                      color: AppColors.of(context).basicBlue.withOpacity(0.6),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20).h,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '4.000',
                    style: AppFonts.interMedium48.copyWith(
                      color: AppColors.of(context).basicBlue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Spacer(),
                CustomCalculator(
                  onDisplayTextChanged: (String value) {
                    context.read<CalculatorTableCubit>().displayText(value);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
