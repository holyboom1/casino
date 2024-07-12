part of 'calculator_table_cubit.dart';

class CalculatorTableState extends Equatable {
  final RouletteCalculator? rouletteCalculator;
  final String displayText;

  const CalculatorTableState({
    this.rouletteCalculator,
    this.displayText = '',
  });

  CalculatorTableState copyWith({
    RouletteCalculator? rouletteCalculator,
    String? displayText,
  }) {
    return CalculatorTableState(
      rouletteCalculator: rouletteCalculator ?? this.rouletteCalculator,
      displayText: displayText ?? this.displayText,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        rouletteCalculator,
        displayText,
      ];
}
