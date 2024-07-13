part of 'calculator_table_cubit.dart';

class CalculatorTableState extends Equatable {
  final RouletteCellModel number;
  final String displayText;
  final String errorText;

  const CalculatorTableState({
    required this.number,
    this.displayText = '',
    this.errorText = '',
  });

  CalculatorTableState copyWith({
    RouletteCellModel? number,
    String? displayText,
    String? errorText,
  }) {
    return CalculatorTableState(
      number: number ?? this.number,
      displayText: displayText ?? this.displayText,
      errorText: errorText ?? this.errorText,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        number,
        displayText,
        errorText,
      ];
}
