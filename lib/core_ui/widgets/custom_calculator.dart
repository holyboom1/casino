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
  final bool isReadyForDone;

  const CustomCalculator({
    required this.onDisplayTextChanged,
    this.isSettingsCalculator = false,
    required this.onDonePressed,
    this.isReadyForDone = false,
    super.key,
  });

  @override
  _CustomCalculatorState createState() => _CustomCalculatorState();
}

class _CustomCalculatorState extends State<CustomCalculator> {
  String _displayText = '';
  String _formula = '';

  void _updateDisplayText(String value) {
    setState(() {
      _displayText = value;
      widget.onDisplayTextChanged(_displayText);
    });
  }

  void _onButtonPressed(String value) {
    setState(() {
      _formula += value;
      _updateDisplayText(_formula);
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (_formula.isNotEmpty && !_isOperator(_formula[_formula.length - 1])) {
        _formula += ' $operator ';
        _updateDisplayText(_formula);
      }
    });
  }

  bool _isOperator(String character) {
    return <String>['+', '-', '*', '/'].contains(character);
  }

  void _onEqualsPressed() {
    try {
      final int result = _evaluateExpression(_formula);
      setState(() {
        _updateDisplayText(result.toString());
        _formula = result.toString();
      });
    } catch (e) {
      setState(() {
        _updateDisplayText('Error');
        _formula = '';
      });
    }
  }

  int _evaluateExpression(String expression) {
    final List<String> tokens = expression.split(' ');
    final List<int> values = <int>[];
    final List<String> operators = <String>[];

    for (var token in tokens) {
      if (token.isEmpty) continue;
      if (_isOperator(token)) {
        operators.add(token);
      } else {
        values.add(int.parse(token));
      }
    }

    while (operators.isNotEmpty) {
      final String operator = operators.removeAt(0);
      final int a = values.removeAt(0);
      final int b = values.removeAt(0);
      final int result;

      switch (operator) {
        case '+':
          result = a + b;
          break;
        case '-':
          result = a - b;
          break;
        case '*':
          result = a * b;
          break;
        case '/':
          if (b == 0) throw Exception('Division by zero');
          result = a ~/ b;
          break;
        default:
          throw Exception('Unknown operator');
      }

      values.insert(0, result);
    }

    return values.single;
  }

  void _onClearPressed() {
    setState(() {
      if (_formula.isNotEmpty) {
        _formula = _formula.substring(0, _formula.length - 1);
        _updateDisplayText(_formula);
      }
    });
  }

  void _onDonePressed() {
    widget.onDonePressed(_displayText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!widget.isSettingsCalculator)
            _buildButtonRow(<Widget>[
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
                value: '*',
                type: AppButtonType.secondaryGreen,
                onPressed: () => _onOperatorPressed('*'),
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
          _buildButtonRow(<Widget>[
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
          _buildButtonRow(<Widget>[
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
          _buildButtonRow(<Widget>[
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
            <Widget>[
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
                type:
                    widget.isReadyForDone ? AppButtonType.primaryGreen : AppButtonType.transparent,
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
