import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_table_state.dart';

class CalculatorTableCubit extends Cubit<CalculatorTableState> {
  final AppRouter _appRouter;
  final RouletteCalculator _rouletteCalculator;
  CalculatorTableCubit({
    required AppRouter appRouter,
    required RouletteCalculator rouletteCalculator,
  })  : _appRouter = appRouter,
        _rouletteCalculator = rouletteCalculator,
        super(CalculatorTableState()) {
    _init();
  }

  void _init() {
    emit(state.copyWith(
      rouletteCalculator: _rouletteCalculator,
    ));
  }
}
