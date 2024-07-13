import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../core_ui/theme/app_colors.dart';

class RouletteCalculator {
  double _maxBet = 1000;

  set maxBet(double value) {
    _maxBet = value;
  }

  final List<Color> _cellColors = <Color>[
    Colors.grey,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
    AppColors.black,
    AppColors.red,
  ];

  double get maxBet => _maxBet;

  final Map<int, RouletteCellModel> rulletteFieldBets = <int, RouletteCellModel>{};

  void initRouletteFieldBets() {
    for (int i = 0; i < 37; i++) {
      rulletteFieldBets[i] = RouletteCellModel(
        number: i,
        color: i == 0 ? Colors.green : _cellColors[i],
        bet: ValueNotifier<double>(0),
      );
    }
  }

  void clearRouletteFieldBets() {
    for (int i = 0; i < 37; i++) {
      rulletteFieldBets[i]!.clearBet();
    }
  }

  void setRouletteFieldBet(int number, double bet) {
    rulletteFieldBets[number]!.changeBet(bet);
  }

  int cellNumber(int i, int j) {
    if (i == 0) {
      return j + 1;
    } else if (i == 1) {
      return j + 4;
    } else if (i == 2) {
      return j + 7;
    } else if (i == 3) {
      return j + 10;
    } else if (i == 4) {
      return j + 13;
    } else if (i == 5) {
      return j + 16;
    } else if (i == 6) {
      return j + 19;
    } else if (i == 7) {
      return j + 22;
    } else if (i == 8) {
      return j + 25;
    } else if (i == 9) {
      return j + 28;
    } else if (i == 10) {
      return j + 31;
    } else if (i == 11) {
      return j + 34;
    }
    return 0;
  }

  CalculationResult calculateResult({
    required RouletteCellModel winCell,
  }) {
    double betAmount = 0;
    double change = 0;
    double betAmountWithoutChange = 0;
    double displayInNum = 0;
    double displayInNumForehead = 0;
    double completionPayment = 0;
    double paymentOfDelivered = 0;

    /// ХЗ Что тут считать надо . Вместо этого метода можно сделать метод который будет считать  выигрышь
    for (int i = 0; i < 37; i++) {
      betAmount += rulletteFieldBets[i]!.bet.value;
    }

    betAmountWithoutChange = betAmount;

    if (betAmount > _maxBet) {
      change = betAmount - _maxBet;
      betAmount = _maxBet;
    }

    displayInNum = betAmount * 36;
    displayInNumForehead = betAmount * 36;
    completionPayment = displayInNum + betAmount;
    paymentOfDelivered = completionPayment - betAmount;

    return CalculationResult(
      betAmount: betAmount.toStringAsFixed(2),
      change: change.toStringAsFixed(2),
      betAmountWithoutChange: betAmountWithoutChange.toStringAsFixed(2),
      displayInNum: displayInNum.toStringAsFixed(2),
      displayInNumForehead: displayInNumForehead.toStringAsFixed(2),
      completionPayment: completionPayment.toStringAsFixed(2),
      paymentOfDelivered: paymentOfDelivered.toStringAsFixed(2),
    );
  }
}

class RouletteCellModel {
  final int number;
  final Color color;
  final ValueNotifier<double> bet;

  RouletteCellModel({
    required this.number,
    required this.color,
    required this.bet,
  });

  void changeBet(double value) {
    bet.value = value;
  }

  void clearBet() {
    bet.value = 0;
  }
}

class CalculationResult extends Equatable {
  final String betAmount;
  final String change;
  final String betAmountWithoutChange;
  final String displayInNum;
  final String displayInNumForehead;
  final String completionPayment;
  final String paymentOfDelivered;

  const CalculationResult({
    this.betAmount = '0',
    this.change = '0',
    this.betAmountWithoutChange = '0',
    this.displayInNum = '0',
    this.displayInNumForehead = '0',
    this.completionPayment = '0',
    this.paymentOfDelivered = '0',
  });

  CalculationResult copyWith({
    String? betAmount,
    String? change,
    String? betAmountWithoutChange,
    String? displayInNum,
    String? displayInNumForehead,
    String? completionPayment,
    String? paymentOfDelivered,
  }) {
    return CalculationResult(
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
  List<Object?> get props => <Object?>[
        betAmount,
        change,
        betAmountWithoutChange,
        displayInNum,
        displayInNumForehead,
        completionPayment,
        paymentOfDelivered,
      ];
}
