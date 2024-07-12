import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../core/utils/calculator.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/calculator_result_cubit.dart';
import 'calculator_result_form.dart';

class CalculatorResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorResultCubit>(
      create: (BuildContext context) => CalculatorResultCubit(
        appRouter: appLocator<AppRouter>(),
        rouletteCalculator: appLocator<RouletteCalculator>(),
      ),
      child: CalculatorResultForm(),
    );
  }
}
