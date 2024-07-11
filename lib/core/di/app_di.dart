import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../navigation/di/navigation_di.dart';
import '../utils/calculator.dart';

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

  return completer.future;
}

Future<void> goToAuthScope() async {}
