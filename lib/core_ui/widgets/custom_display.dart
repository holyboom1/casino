import 'package:flutter/material.dart';
import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CustomDisplayContainer extends StatelessWidget {
  final bool isFocus;
  final String displayText;
  final String? title;

  const CustomDisplayContainer({
    required this.isFocus,
    required this.displayText,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: isFocus ? 29.h : 52.h),
      decoration: BoxDecoration(
        color: isFocus ? AppColors.of(context).basicWhite : AppColors.of(context).secondaryBg,
        borderRadius: BorderRadius.circular(24).r,
        border: Border.all(
          color: isFocus ? AppColors.of(context).basicBlue : AppColors.transparent,
          width: 2,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title ?? LocaleKeys.common_comp_amount.tr(),
              style: !isFocus
                  ? AppFonts.interMedium42
                      .copyWith(color: AppColors.of(context).basicBlue.withOpacity(0.6))
                  : AppFonts.interMedium30
                      .copyWith(color: AppColors.of(context).basicBlue.withOpacity(0.6)),
            ),
            if (isFocus)
              Text(
                displayText,
                style: AppFonts.interMedium42.copyWith(
                  color: isFocus
                      ? AppColors.of(context).basicBlue
                      : AppColors.of(context).basicBlue.withOpacity(0.6),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
