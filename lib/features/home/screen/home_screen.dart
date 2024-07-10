import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/home_bloc.dart';
import 'home_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        appRouter: appLocator<AppRouter>(),
      ),
      child: HomeForm(),
    );
  }
}
