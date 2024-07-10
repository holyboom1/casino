import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core_ui/theme/app_dimens.dart';
import '../bloc/home_bloc.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, HomeState state) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(height: AppDimens.size100.h),
              const Placeholder(),
            ],
          ),
        );
      },
    );
  }
}
