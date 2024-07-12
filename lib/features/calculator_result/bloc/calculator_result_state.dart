part of 'calculator_result_cubit.dart';

class CalculatorResultState extends Equatable {
  final String betAmount;
  final String change;
  final String betAmountWithoutChange;
  final String displayInNum;
  final String displayInNumForehead;
  final String completionPayment;
  final String paymentOfDelivered;

  const CalculatorResultState({
    this.betAmount = '100',
    this.change = '31',
    this.betAmountWithoutChange = '111',
    this.displayInNum = '3133113',
    this.displayInNumForehead = '1111',
    this.completionPayment = '311',
    this.paymentOfDelivered = '111',
  });

  CalculatorResultState copyWith({
    String? betAmount,
    String? change,
    String? betAmountWithoutChange,
    String? displayInNum,
    String? displayInNumForehead,
    String? completionPayment,
    String? paymentOfDelivered,
  }) {
    return CalculatorResultState(
      betAmount: betAmount ?? this.betAmount,
      change: change ?? this.change,
      betAmountWithoutChange: betAmountWithoutChange ?? this.betAmountWithoutChange,
      displayInNum: displayInNum ?? this.displayInNum,
      displayInNumForehead: displayInNumForehead ?? this.displayInNumForehead,
      completionPayment: completionPayment ?? this.completionPayment,
      paymentOfDelivered: paymentOfDelivered ?? this.paymentOfDelivered,
    );
  }

  @override
  List<Object> get props => <Object>[
        betAmount,
        change,
        betAmountWithoutChange,
        displayInNum,
        displayInNumForehead,
        completionPayment,
        paymentOfDelivered,
      ];
}
