import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../core/utils/calculator.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/calculator_table_cubit.dart';
import 'calculator_table_form.dart';

class CalculatorTableScreen extends StatelessWidget {
  final RouletteCellModel number;

  const CalculatorTableScreen({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalculatorTableCubit>(
      create: (BuildContext context) => CalculatorTableCubit(
        number: number,
        appRouter: appLocator<AppRouter>(),
        rouletteCalculator: appLocator<RouletteCalculator>(),
      ),
      child: CalculatorTableForm(),
    );
  }
}
