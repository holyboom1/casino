import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_select_win_number_state.dart';

class CalculatorSelectWinNumberCubit extends Cubit<CalculatorSelectWinNumberState> {
  final AppRouter _appRouter;
  final RouletteCalculator _rouletteCalculator;

  CalculatorSelectWinNumberCubit({
    required AppRouter appRouter,
    required RouletteCalculator rouletteCalculator,
  })  : _appRouter = appRouter,
        _rouletteCalculator = rouletteCalculator,
        super(const CalculatorSelectWinNumberState()) {
    _init();
  }

  void _init() {}

  void plus(int number) {}

  void minus(int number) {}

  void displayText(String displayText) {
    emit(state.copyWith(displayText: displayText));
  }
}
