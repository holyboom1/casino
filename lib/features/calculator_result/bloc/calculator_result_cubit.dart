import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_result_state.dart';

class CalculatorResultCubit extends Cubit<CalculatorResultState> {
  final AppRouter _appRouter;
  final RouletteCalculator _rouletteCalculator;
  CalculatorResultCubit({
    required AppRouter appRouter,
    required RouletteCalculator rouletteCalculator,
  })  : _appRouter = appRouter,
        _rouletteCalculator = rouletteCalculator,
        super(CalculatorResultState()) {
    _init();
  }

  void _init() {
    emit(state.copyWith());
  }
}
