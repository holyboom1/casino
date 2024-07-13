part of 'calculator_result_cubit.dart';

class CalculatorResultState extends Equatable {
  final CalculationResult result;

  const CalculatorResultState({
    this.result = const CalculationResult(),
  });

  CalculatorResultState copyWith({
    CalculationResult? result,
  }) {
    return CalculatorResultState(
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => <Object>[
        result,
      ];
}
