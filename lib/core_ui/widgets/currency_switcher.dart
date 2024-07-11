import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class CurrencySwitcher extends StatefulWidget {
  @override
  _CurrencySwitcherState createState() => _CurrencySwitcherState();
}

class _CurrencySwitcherState extends State<CurrencySwitcher> {
  Currency _selectedCurrency = Currency.EUR;

  void _onCurrencyTap(Currency currency) {
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
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? appColors.basicWhite : appColors.secondaryBg,
            borderRadius: BorderRadius.circular(12.0),
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
            style: AppFonts.interMedium30.copyWith(color: appColors.basicBlue),
          ),
        ),
      ),
    );
  }
}
