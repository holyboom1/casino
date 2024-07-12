import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_table_state.dart';

class CalculatorTableCubit extends Cubit<CalculatorTableState> {
  final AppRouter _appRouter;
  final RouletteCalculator _rouletteCalculator;

  CalculatorTableCubit({
    required AppRouter appRouter,
    required RouletteCalculator rouletteCalculator,
    required RouletteCellModel number,
  })  : _appRouter = appRouter,
        _rouletteCalculator = rouletteCalculator,
        super(CalculatorTableState(number: number)) {
    _init();
  }

  void _init() {
    emit(state.copyWith(rouletteCalculator: _rouletteCalculator));
  }

  void plus(int number) {}

  void minus(int number) {}

  void displayText(String displayText) {
    emit(state.copyWith(displayText: displayText));
  }
}
