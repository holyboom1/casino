import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_result_state.dart';

class CalculatorResultCubit extends Cubit<CalculatorResultState> {
  final AppRouter _appRouter;
  final RouletteCalculator _rouletteCalculator;
  final RouletteCellModel _number;
  CalculatorResultCubit({
    required AppRouter appRouter,
    required RouletteCalculator rouletteCalculator,
    required RouletteCellModel number,
  })  : _appRouter = appRouter,
        _rouletteCalculator = rouletteCalculator,
        _number = number,
        super(const CalculatorResultState()) {
    _init();
  }

  void _init() {
    emit(state.copyWith(
      result: _rouletteCalculator.calculateResult(winCell: _number),
    ));
  }
}
