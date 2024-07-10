import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/app_router/app_router.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;

  HomeBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const HomeState()) {
    on<InitEvent>(_onInit);

    add(InitEvent());
  }

  void _onInit(
    InitEvent event,
    Emitter<HomeState> emit,
  ) {
    /// TODO: implement _onInit
  }
}
