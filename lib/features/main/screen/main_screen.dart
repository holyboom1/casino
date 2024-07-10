import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/main_bloc.dart';
import 'main_form.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (BuildContext context) => MainBloc(),
      child: MainForm(navigationShell: navigationShell),
    );
  }
}
