import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/core_export.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

part 'input_field_border.dart';

class InputField extends StatefulWidget {
  final bool isPassword;
  final String errorText;
  final bool isError;
  final String initValue;
  final Function(String)? onChanged;
  final String? hintText;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isFocusRequestAvailable;
  final VoidCallback? onTap;
  final bool isDebouncerNeed;
  final List<String> autofillHints;
  final TextEditingController? controller;
  final bool isNeedDispose;
  final double verticalPadding;
  final FocusNode? focusNode;
  final bool? hasBorder;
  final EdgeInsetsGeometry? padding;
  final bool? isNeedRequestFocus;
  final Function(bool)? updateShowingStartContent;
  final bool isTransparent;
  final bool? isCommentTextField;
  final Color? backgroundColor;
  final double? multilinePadding;

  const InputField({
    super.key,
    this.isPassword = false,
    this.errorText = '',
    this.isError = false,
    this.initValue = '',
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.isReadOnly = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.hintText,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.isFocusRequestAvailable,
    this.onTap,
    this.isDebouncerNeed = false,
    this.autofillHints = const <String>[],
    this.controller,
    this.isNeedDispose = true,
    this.verticalPadding = 16,
    this.focusNode,
    this.hasBorder,
    this.padding,
    this.isNeedRequestFocus = false,
    this.updateShowingStartContent,
    this.isTransparent = true,
    this.isCommentTextField = false,
    this.backgroundColor,
    this.multilinePadding,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final FocusNode focusNode;
  late final TextEditingController controller;
  bool isTextObscured = false;
  List<TextInputFormatter> inputFormatters = <TextInputFormatter>[];

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    if (widget.isNeedRequestFocus != null && widget.isNeedRequestFocus!) {
      focusNode.requestFocus();
    }

    focusNode.addListener(_onChangeFocus);
    controller = widget.controller ?? TextEditingController();
    controller.text = widget.initValue;
  }

  @override
  void dispose() {
    focusNode.dispose();
    focusNode.removeListener(_onChangeFocus);
    if (widget.isNeedDispose) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onChangeFocus() {
    //TODO remove comments if needed
    // if (!focusNode.hasFocus) {
    //   widget.onChanged?.call(controller.value.text);
    // }
    if (focusNode.hasFocus && widget.updateShowingStartContent != null) {
      widget.updateShowingStartContent!(false);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);
    final ValueNotifier<String> onTextChangedNotifier = ValueNotifier<String>('');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InputFieldBorder(
          backgroundColor: widget.backgroundColor,
          isMultiLine: widget.maxLines != null,
          isTransparent: widget.isTransparent,
          focusNode: focusNode,
          isDisabled: widget.isReadOnly,
          isError: widget.isError,
          hasBorder: widget.hasBorder ?? true,
          child: Padding(
            padding:
                widget.padding ?? const EdgeInsets.symmetric(horizontal: AppDimens.padding16).r,
            child: TextFormField(
              minLines: widget.minLines,
              autofillHints: widget.autofillHints,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              maxLength: widget.maxLength,
              canRequestFocus: widget.isFocusRequestAvailable ?? true,
              controller: controller,
              inputFormatters: widget.inputFormatters,
              focusNode: focusNode,
              enabled: !widget.isReadOnly,
              onChanged: (String text) {
                onTextChangedNotifier.value = text;
                widget.onChanged?.call(text);
              },
              onFieldSubmitted: widget.onFieldSubmitted,
              onEditingComplete: widget.onEditingComplete,
              obscureText: widget.isPassword ? !isTextObscured : isTextObscured,
              textInputAction: TextInputAction.done,
              keyboardType: widget.keyboardType,
              cursorColor: appColors.basicGreen,
              cursorRadius: Radius.circular(AppDimens.size1.r),
              style: AppFonts.baseFont16.copyWith(
                color: appColors.primaryBg,
              ),
              maxLines: widget.maxLines ??
                  (widget.isCommentTextField != null && widget.isCommentTextField! ? null : 1),
              decoration: InputDecoration(
                counterText: '',
                alignLabelWithHint: false,
                isDense: false,
                contentPadding: const EdgeInsets.symmetric(vertical: AppDimens.padding12).r,
                hintStyle: AppFonts.interMedium48.copyWith(
                  color: appColors.primaryBg.withOpacity(0.6),
                ),
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: BoxConstraints(
                  maxWidth: AppDimens.size32.w,
                ),
              ),
            ),
          ),
        ),
        if (widget.isError && widget.errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.padding8).r,
            child: Text(
              widget.errorText,
              style: AppFonts.interMedium24.copyWith(
                color: appColors.errorRed,
              ),
            ),
          ),
      ],
    );
  }

  double getPaddingForMultiLineField(int maxLines) {
    return maxLines * 24 -
        (widget.multilinePadding != null ? widget.multilinePadding! : AppDimens.padding28.h);
  }
}
