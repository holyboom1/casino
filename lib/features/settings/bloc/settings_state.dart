part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Currency currency;
  final String maxBetAmount;

  const SettingsState({
    this.currency = Currency.EUR,
    this.maxBetAmount = '',
  });

  SettingsState copyWith({
    Currency? currency,
    String? maxBetAmount,
  }) {
    return SettingsState(
      currency: currency ?? this.currency,
      maxBetAmount: maxBetAmount ?? this.maxBetAmount,
    );
  }

  @override
  List<Object> get props => <Object>[
        currency,
        maxBetAmount,
      ];
}
