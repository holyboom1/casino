import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';
import '../../../core/utils/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppRouter _appRouter;

  SettingsCubit({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const SettingsState()) {
    _init();
  }

  void _init() {
    emit(state.copyWith(
      currency: Currency.fromString(appLocator<SettingsBox>().currency),
      maxBetAmount: appLocator<SettingsBox>().maxAmount,
    ));
  }

  void changeCurrency(Currency currency) {
    emit(state.copyWith(currency: currency));
    appLocator<SettingsBox>().currency = currency.name;
  }

  void changeMaxBetAmount(String maxBetAmount) {
    emit(state.copyWith(maxBetAmount: maxBetAmount));
    appLocator<SettingsBox>().maxAmount = maxBetAmount;
  }

  void displayMaxAmount(String maxBetAmount) {
    emit(state.copyWith(maxBetAmount: maxBetAmount));
    appLocator<SettingsBox>().maxAmount = maxBetAmount;
  }
}
