import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/app_di.dart';
import '../../../navigation/app_router/app_router.dart';
import '../bloc/settings_cubit.dart';
import 'settings_form.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (BuildContext context) => SettingsCubit(
        appRouter: appLocator<AppRouter>(),
      ),
      child: SettingsForm(),
    );
  }
}
