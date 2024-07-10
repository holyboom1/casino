import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/splash_bloc.dart';
import 'splash_form.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) => SplashBloc(
        appRouter: appLocator<AppRouter>(),
      ),
      child: SplashForm(),
    );
  }
}
