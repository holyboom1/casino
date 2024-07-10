import 'package:flutter/material.dart';

class BottomSheetDialogPage<T> extends Page<T> {
  final WidgetBuilder builder;

  const BottomSheetDialogPage({
    required this.builder,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => _BottomSheetDialogRoute<T>(
        settings: this,
        builder: builder,
      );
}

class _BottomSheetDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  _BottomSheetDialogRoute({
    required this.builder,
    required RouteSettings settings,
  }) : super(settings: settings);

  @override
  bool get barrierDismissible => true;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => Colors.black54.withOpacity(0.5); // semi-transparent background

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        ),
      ),
      child: child,
    );
  }
}
