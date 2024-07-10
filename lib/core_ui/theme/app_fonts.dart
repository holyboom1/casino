import 'package:flutter/material.dart';

import 'app_dimens.dart';


class AppFonts {
  static const String kSFProRoundedFontFamily = 'SFProRounded';

  ///SFProRounded font style
  static TextStyle get sfPro => const TextStyle(
        fontFamily: kSFProRoundedFontFamily,
      );

  static TextStyle get thinSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w100,
      );

  static TextStyle get extraLightSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w200,
      );

  static TextStyle get lightSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w300,
      );

  static TextStyle get normalSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle get mediumSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get semiBoldSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get boldSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get extraBoldSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w800,
      );

  static TextStyle get blackBoldSfPro => sfPro.copyWith(
        fontWeight: FontWeight.w900,
      );

  static TextStyle get titleM => semiBoldSfPro.copyWith(
        fontSize: AppDimens.fontSize32,
        height: AppDimens.heightFactor125,
      );

  static TextStyle get titleS => mediumSfPro.copyWith(
        fontSize: AppDimens.fontSize24,
        height: AppDimens.heightFactor13,
      );

  static TextStyle get displayM => mediumSfPro.copyWith(
        fontSize: AppDimens.fontSize24,
        height: AppDimens.heightFactor13,
      );

  static TextStyle get displayS => normalSfPro.copyWith(
        fontSize: AppDimens.fontSize20,
        height: AppDimens.heightFactor12,
      );

  static TextStyle get bodyM => mediumSfPro.copyWith(
        fontSize: AppDimens.fontSize18,
        height: AppDimens.heightFactor13,
      );

  static TextStyle get bodySMedium => mediumSfPro.copyWith(
        fontSize: AppDimens.fontSize14,
        height: AppDimens.heightFactor125,
      );

  static TextStyle get bodySRegular => normalSfPro.copyWith(
        fontSize: AppDimens.fontSize14,
        height: AppDimens.heightFactor12,
      );

  static TextStyle get bodyXS => mediumSfPro.copyWith(
        fontSize: AppDimens.fontSize12,
        height: AppDimens.heightFactor12,
      );

  static TextStyle get bodyXXS => normalSfPro.copyWith(
        fontSize: AppDimens.fontSize10,
        height: AppDimens.heightFactor12,
      );
}
