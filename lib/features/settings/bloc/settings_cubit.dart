import 'package:equatable/equatable.dart';

import '../../../core/core_export.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final AppRouter _appRouter;

  SettingsCubit({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(SettingsState()) {
    _init();
  }

  void _init() {}
}
