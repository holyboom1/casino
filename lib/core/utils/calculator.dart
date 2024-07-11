import 'package:flutter/material.dart';

class RouletteCalculator {
  double _maxBet = 1000;

  set maxBet(double value) {
    _maxBet = value;
  }

  final List<Color> _cellColors = [
    Colors.grey,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
    Colors.black,
    Colors.red,
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
