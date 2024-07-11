import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

enum AppButtonType {
  primaryGreen,
  secondaryGreen,
  white,
  transparent,
}

class AppButton extends StatefulWidget {
  final AppButtonType type;
  final VoidCallback? onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final Widget? prefixWidget;
  final double? borderRadius;
  final double? width;
  final bool isLoading;
  final bool isDisabled;
  final WidgetStateProperty<BorderSide?>? side;

  const AppButton({
    required this.buttonText,
    this.type = AppButtonType.primaryGreen,
    this.buttonTextStyle,
    this.onPressed,
    this.verticalPadding,
    this.horizontalPadding,
    this.prefixWidget,
    this.borderRadius,
    this.width,
    this.isLoading = false,
    this.isDisabled = false,
    this.side,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  final GlobalKey contentKey = GlobalKey();
  double contentHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          contentHeight = contentKey.currentContext?.size?.height ?? 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    Color textColor = appColors.basicWhite;
    Color loaderColor = appColors.basicWhite;
    Color backgroundColor = appColors.basicGreen;
    final double radius = AppDimens.borderRadius24.r;

    BorderSide? side = BorderSide.none;

    switch (widget.type) {
      case AppButtonType.primaryGreen:
        side = const BorderSide(color: AppColors.transparent);
        backgroundColor = appColors.basicGreen;
        break;

      case AppButtonType.secondaryGreen:
        side =  BorderSide(color: AppColors.of(context).basicBlue.withOpacity(0.2));
        backgroundColor = AppColors.of(context).primaryBg;
        textColor = AppColors.of(context).basicBlue;
        break;

      case AppButtonType.white:
        side = const BorderSide(color: AppColors.transparent);
        textColor = appColors.basicBlue;
        loaderColor = appColors.basicBlue;
        backgroundColor = appColors.basicWhite;
        break;

      case AppButtonType.transparent:
        side = const BorderSide(color: AppColors.transparent);
        textColor = appColors.secondaryBg;
        loaderColor = appColors.secondaryBg;
        backgroundColor = AppColors.of(context).primaryBg;
        break;
    }

    return GestureDetector(
      onTap: widget.isDisabled ? null : widget.onPressed,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? radius),
          border: Border.fromBorderSide(side),
          color: backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: widget.verticalPadding ?? AppDimens.padding16.h,
          horizontal: widget.horizontalPadding ?? AppDimens.padding12.w,
        ),
        child: widget.isLoading
            ? Center(
                child: SizedBox(
                  height: contentHeight,
                  width: contentHeight,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: loaderColor,
                  ),
                ),
              )
            : Row(
                key: contentKey,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.prefixWidget != null)
                    Padding(
                      padding: widget.buttonText.isEmpty
                          ? EdgeInsets.zero
                          : EdgeInsets.only(right: AppDimens.padding6.w),
                      child: widget.prefixWidget,
                    ),
                  Text(
                    widget.buttonText,
                    style: widget.buttonTextStyle ??
                        AppFonts.interMedium30.copyWith(
                          color: textColor.withOpacity(
                            widget.isDisabled ? 0.5 : 1,
                          ),
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
