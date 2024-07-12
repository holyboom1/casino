part of 'calculator_table_cubit.dart';

class CalculatorTableState extends Equatable {
  final RouletteCalculator? rouletteCalculator;
  final RouletteCellModel number;
  final String displayText;

  const CalculatorTableState({
    required this.number,
    this.rouletteCalculator,
    this.displayText = '',
  });

  CalculatorTableState copyWith({
    RouletteCalculator? rouletteCalculator,
    RouletteCellModel? number,
    String? displayText,
  }) {
    return CalculatorTableState(
      rouletteCalculator: rouletteCalculator ?? this.rouletteCalculator,
      number: number ?? this.number,
      displayText: displayText ?? this.displayText,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        rouletteCalculator,
        number,
        displayText,
      ];
}
