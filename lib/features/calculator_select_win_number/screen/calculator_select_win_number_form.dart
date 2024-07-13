import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_colors.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../../../core_ui/theme/app_images.dart';
import '../../../core_ui/widgets/widgets.dart';
import '../bloc/calculator_select_win_number_cubit.dart';

class CalculatorSelectWinNumberForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorSelectWinNumberCubit, CalculatorSelectWinNumberState>(
      builder: (BuildContext context, CalculatorSelectWinNumberState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.of(context).primaryBg,
            title: Text(
              LocaleKeys.common_calculation.tr(),
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
          body: Column(
            children: <Widget>[
              Text(
                LocaleKeys.common_select_the_drawn_number.tr(),
                style: AppFonts.interMedium30.copyWith(
                  color: AppColors.of(context).basicBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 30.h),
              RouletteTable(
                onPressed: (RouletteCellModel number) {
                  appLocator<AppRouter>().router.goNamed(
                        RouterConstants.calculatorResultRoute,
                        extra: number,
                      );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
