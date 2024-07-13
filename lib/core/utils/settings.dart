import 'package:hive/hive.dart';

import '../core_export.dart';

class SettingsBox {
  late Box<String> settingsBox;

  Future<void> init() async {
    settingsBox = await Hive.openBox('settings');
  }

  String get maxAmount {
    final String result = settingsBox.get('maxAmount') ?? '1000';
    return result;
  }

  set maxAmount(String value) {
    appLocator<RouletteCalculator>().maxBet = double.parse(value);
    settingsBox.put('maxAmount', value);
  }

  String get currency {
    return settingsBox.get('currency') ?? 'EUR';
  }

  set currency(String value) {
    settingsBox.put('currency', value);
  }
}
