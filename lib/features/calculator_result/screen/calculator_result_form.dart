import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../bloc/calculator_result_cubit.dart';

class CalculatorResultForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorResultCubit, CalculatorResultState>(
      builder: (BuildContext context, CalculatorResultState state) {
        return Placeholder();
      },
    );
  }
}
