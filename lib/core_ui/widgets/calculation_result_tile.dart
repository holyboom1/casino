import 'package:flutter/cupertino.dart';

import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CalculationResultTile extends StatelessWidget {
  final String title;
  final String value;

  const CalculationResultTile({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: AppFonts.interMedium30.copyWith(
              color: AppColors.of(context).basicBlue.withOpacity(0.6),
            ),
          ),
        ),
        SizedBox(width: AppDimens.padding50.w),
        Expanded(
          child: Text(
            value,
            style: AppFonts.interMedium42.copyWith(
              color: AppColors.of(context).basicBlue,
            ),
          ),
        ),
      ],
    );
  }
}
