import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../bloc/calculator_table_cubit.dart';

class CalculatorTableForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorTableCubit, CalculatorTableState>(
      builder: (BuildContext context, CalculatorTableState state) {
        if (state.rouletteCalculator == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}
