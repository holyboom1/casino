import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import 'widgets.dart';

class CustomCalculator extends StatefulWidget {
  final bool isSettingsCalculator;

  const CustomCalculator({
    this.isSettingsCalculator = false,
    super.key,
  });

  @override
  _CustomCalculatorState createState() => _CustomCalculatorState();
}

class _CustomCalculatorState extends State<CustomCalculator> {
  String _displayText = '';

  void _onButtonPressed(String value) {
    setState(() {
      _displayText += value;
    });
  }

  void _onEqualsPressed() {
    setState(() {
      _displayText = 'Result';
    });
  }

  void _onClearPressed() {
    setState(() {
      _displayText = '';
    });
  }

  void _onDonePressed() {}

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!widget.isSettingsCalculator)
            _buildButtonRow([
              _buildButton(
                text: '+',
                value: '+',
                type: AppButtonType.secondaryGreen,
              ),
              _buildButton(
                text: '-',
                value: '-',
                type: AppButtonType.secondaryGreen,
              ),
              _buildButton(
                text: 'x',
                value: 'x',
                type: AppButtonType.secondaryGreen,
              ),
              _buildButton(
                text: '/',
                value: '/',
                type: AppButtonType.secondaryGreen,
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
          _buildButtonRow([
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
          ]),
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
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          buttonText: text,
          type: type,
          onPressed: onPressed ?? () => _onButtonPressed(value),
          verticalPadding: 16.0,
          horizontalPadding: 16.0,
          prefixWidget: prefixIcon != null
              ? AppImage(
                  image: prefixIcon,
                  width: 24,
                  color: AppColors.of(context).basicBlue,
                )
              : null,
        ),
      ),
    );
  }
}
