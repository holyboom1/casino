import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../core/constants/route_constants.dart';
import '../../../navigation/app_router/app_router.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;

  SplashBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(SplashState()) {
    on<InitEvent>(_onInitEvent);

    add(InitEvent());
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<SplashState> emit,
  ) async {
    FlutterNativeSplash.remove();
    try {
      unawaited(_appRouter.router.replace(RouterConstants.mainRoute));
    } catch (e) {
      rethrow;
    }
  }
}
