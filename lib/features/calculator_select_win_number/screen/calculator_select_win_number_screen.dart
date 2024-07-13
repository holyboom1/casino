import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../core/utils/calculator.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/calculator_select_win_number_cubit.dart';
import 'calculator_select_win_number_form.dart';

class CalculatorSelectWinNumberScreen extends StatelessWidget {
  const CalculatorSelectWinNumberScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorSelectWinNumberCubit>(
      create: (BuildContext context) => CalculatorSelectWinNumberCubit(
        appRouter: appLocator<AppRouter>(),
        rouletteCalculator: appLocator<RouletteCalculator>(),
      ),
      child: CalculatorSelectWinNumberForm(),
    );
  }
}
