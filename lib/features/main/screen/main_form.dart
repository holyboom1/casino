import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainForm extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainForm({
    required this.navigationShell,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
