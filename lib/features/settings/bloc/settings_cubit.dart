import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppRouter _appRouter;

  SettingsCubit({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const SettingsState()) {
    _init();
  }

  void _init() {}

  void changeCurrency(Currency currency) {
    emit(state.copyWith(currency: currency));
  }

  void changeMaxBetAmount(String maxBetAmount) {
    emit(state.copyWith(maxBetAmount: maxBetAmount));
  }

  void displayMaxAmount(String maxBetAmount) {
    emit(state.copyWith(maxBetAmount: maxBetAmount));
  }
}
