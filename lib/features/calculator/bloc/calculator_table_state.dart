part of 'calculator_table_cubit.dart';

class CalculatorTableState extends Equatable {
  final RouletteCalculator? rouletteCalculator;

  const CalculatorTableState({
    this.rouletteCalculator,
  });

  CalculatorTableState copyWith({
    RouletteCalculator? rouletteCalculator,
  }) {
    return CalculatorTableState(
      rouletteCalculator: rouletteCalculator ?? this.rouletteCalculator,
    );
  }

  @override
  List<Object> get props => <Object>[];
}
