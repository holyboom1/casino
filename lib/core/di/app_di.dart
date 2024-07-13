import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../navigation/di/navigation_di.dart';
import '../utils/calculator.dart';
import '../utils/settings.dart';

final GetIt appLocator = GetIt.instance;
const String unAuthScope = 'unAuthScope';
const String authScope = 'authScope';

Future<void> setupUnAuthScope() async {
  final Completer<void> completer = Completer<void>();

  appLocator.pushNewScope(
    scopeName: unAuthScope,
    init: (_) async {
      setupNavigationDependencies();
      completer.complete();
    },
  );

  appLocator.registerSingleton<RouletteCalculator>(
    RouletteCalculator()..initRouletteFieldBets(),
  );

  appLocator.registerSingleton<SettingsBox>(SettingsBox());

  await Hive.initFlutter();
  await appLocator<SettingsBox>().init();

  appLocator<RouletteCalculator>().maxBet = double.parse(appLocator<SettingsBox>().maxAmount);

  return completer.future;
}

Future<void> goToAuthScope() async {}
