import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CurrencySwitcher extends StatefulWidget {
  final Function(Currency) onCurrencyChanged;

  const CurrencySwitcher({
    required this.onCurrencyChanged,
    super.key,
  });

  @override
  _CurrencySwitcherState createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher> {
  Currency _selectedCurrency = Currency.EUR;

  void _onCurrencyTap(Currency currency) {
    widget.onCurrencyChanged(currency);
    setState(() {
      _selectedCurrency = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Container(
      decoration: BoxDecoration(
        color: appColors.secondaryBg,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildCurrencyTab(
            currency: Currency.EUR,
            isSelected: _selectedCurrency == Currency.EUR,
            label: 'EUR',
            onTap: _onCurrencyTap,
          ),
          _buildCurrencyTab(
            currency: Currency.TUR,
            isSelected: _selectedCurrency == Currency.TUR,
            label: 'TUR',
            onTap: _onCurrencyTap,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyTab({
    required Currency currency,
    required bool isSelected,
    required String label,
    required void Function(Currency) onTap,
  }) {
    final AppColors appColors = AppColors.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(currency),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0).h,
          decoration: BoxDecoration(
            color: isSelected ? appColors.basicWhite : appColors.secondaryBg,
            borderRadius: BorderRadius.circular(24.0).r,
            boxShadow: isSelected
                ? <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppFonts.interMedium48.copyWith(color: appColors.basicBlue),
          ),
        ),
      ),
    );
  }
}
