import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../theme/app_images.dart';
import 'widgets.dart';

class CustomCalculator extends StatefulWidget {
  final bool isSettingsCalculator;
  final ValueChanged<String> onDisplayTextChanged;
  final Function(String) onDonePressed;

  const CustomCalculator({
    required this.onDisplayTextChanged,
    this.isSettingsCalculator = false,
    required this.onDonePressed,
    super.key,
  });

  @override
  _CustomCalculatorState createState() => _CustomCalculatorState();
}

class _CustomCalculatorState extends State<CustomCalculator> {
  String _displayText = '';
  double? _firstOperand;
  double? _secondOperand;
  String? _operator;

  void _updateDisplayText(String value) {
    setState(() {
      _displayText = value;
      widget.onDisplayTextChanged(_displayText);
    });
  }

  void _onButtonPressed(String value) {
    _updateDisplayText(_displayText + value);
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_firstOperand == null) {
        _firstOperand = double.tryParse(_displayText);
        _updateDisplayText('');
      }
      _operator = operator;
    });
  }

  void _onEqualsPressed() {
    setState(() {
      _secondOperand = double.tryParse(_displayText);
      if (_firstOperand != null && _secondOperand != null && _operator != null) {
        switch (_operator) {
          case '+':
            _updateDisplayText((_firstOperand! + _secondOperand!).toString());
            break;
          case '-':
            _updateDisplayText((_firstOperand! - _secondOperand!).toString());
            break;
          case 'x':
            _updateDisplayText((_firstOperand! * _secondOperand!).toString());
            break;
          case '/':
            _updateDisplayText(
                (_secondOperand != 0) ? (_firstOperand! / _secondOperand!).toString() : 'Error');
            break;
        }
        _firstOperand = null;
        _secondOperand = null;
        _operator = null;
      }
    });
  }

  void _onClearPressed() {
    if (_displayText.isNotEmpty) {
      _updateDisplayText(_displayText.substring(0, _displayText.length - 1));
    }
  }

  void _onDonePressed() {
    widget.onDonePressed(_displayText);
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!widget.isSettingsCalculator)
            _buildButtonRow([
              _buildButton(
                text: '+',
                value: '+',
                type: AppButtonType.secondaryGreen,
                onPressed: () => _onOperatorPressed('+'),
              ),
              _buildButton(
                text: '-',
                value: '-',
                type: AppButtonType.secondaryGreen,
                onPressed: () => _onOperatorPressed('-'),
              ),
              _buildButton(
                text: 'x',
                value: 'x',
                type: AppButtonType.secondaryGreen,
                onPressed: () => _onOperatorPressed('x'),
              ),
              _buildButton(
                text: '/',
                value: '/',
                type: AppButtonType.secondaryGreen,
                onPressed: () => _onOperatorPressed('/'),
              ),
              _buildButton(
                text: '=',
                value: '=',
                type: AppButtonType.secondaryGreen,
                onPressed: _onEqualsPressed,
              ),
            ]),
          _buildButtonRow([
            _buildButton(
              text: '1',
              value: '1',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '2',
              value: '2',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '3',
              value: '3',
              type: AppButtonType.white,
            ),
          ]),
          _buildButtonRow([
            _buildButton(
              text: '4',
              value: '4',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '5',
              value: '5',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '6',
              value: '6',
              type: AppButtonType.white,
            ),
          ]),
          _buildButtonRow([
            _buildButton(
              text: '7',
              value: '7',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '8',
              value: '8',
              type: AppButtonType.white,
            ),
            _buildButton(
              text: '9',
              value: '9',
              type: AppButtonType.white,
            ),
          ]),
          _buildButtonRow(
            [
              _buildButton(
                text: '',
                value: 'C',
                type: AppButtonType.transparent,
                onPressed: _onClearPressed,
                prefixIcon: AppImages.clearIcon,
              ),
              _buildButton(
                text: '0',
                value: '0',
                type: AppButtonType.white,
              ),
              _buildButton(
                text: '',
                value: 'Done',
                type: AppButtonType.transparent,
                onPressed: _onDonePressed,
                prefixIcon: AppImages.doneIcon,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons,
    );
  }

  Widget _buildButton({
    required String text,
    required String value,
    required AppButtonType type,
    VoidCallback? onPressed,
    String? prefixIcon,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: AppButton(
          buttonText: text,
          type: type,
          width: 288.w,
          height: 120.h,
          buttonTextStyle: AppFonts.interMedium42.copyWith(
            color: AppColors.of(context).basicBlue,
          ),
          onPressed: onPressed ?? () => _onButtonPressed(value),
          verticalPadding: 16.0.h,
          horizontalPadding: 16.0.w,
          prefixWidget: prefixIcon != null
              ? AppImage(
                  image: prefixIcon,
                  width: 48.w,
                  color: AppColors.of(context).basicBlue,
                )
              : null,
        ),
      ),
    );
  }
}
