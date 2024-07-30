import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'calculator_table_state.dart';

class CalculatorTableCubit extends Cubit<CalculatorTableState> {
  final AppRouter _appRouter;
  final bool isNewBet;

  CalculatorTableCubit({
    required AppRouter appRouter,
    required RouletteCellModel number,
    this.isNewBet = true,
  })  : _appRouter = appRouter,
        super(CalculatorTableState(number: number)) {
    _init();
  }

  void _init() {
    if (state.displayText.isEmpty) {
      emit(state.copyWith(displayText: state.number.bet.value.toString()));
    }
  }

  void plus(int number) {}

  void minus(int number) {}

  void displayText(String displayText) {
    emit(state.copyWith(displayText: displayText));
  }

  void onDonePressed(String value) {
    final double newBet = double.tryParse(value) ?? 0;

    if (isNewBet) {
      if (newBet + state.number.bet.value > appLocator<RouletteCalculator>().maxBet) {
        emit(state.copyWith(
          errorText: LocaleKeys.errors_sum_error.tr(),
        ));
        return;
      }
      state.number.changeBet(newBet);
      _appRouter.router.pop();
    } else {
      if (newBet > appLocator<RouletteCalculator>().maxBet) {
        emit(state.copyWith(
          errorText: LocaleKeys.errors_sum_error.tr(),
        ));
        return;
      }
      state.number.changeBet(newBet);
    }
  }
}
