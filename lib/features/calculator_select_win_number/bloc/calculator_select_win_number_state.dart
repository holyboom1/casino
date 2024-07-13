part of 'calculator_select_win_number_cubit.dart';

class CalculatorSelectWinNumberState extends Equatable {
  final String displayText;

  const CalculatorSelectWinNumberState({
    this.displayText = '',
  });

  CalculatorSelectWinNumberState copyWith({
    String? displayText,
  }) {
    return CalculatorSelectWinNumberState(
      displayText: displayText ?? this.displayText,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        displayText,
      ];
}
