import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<InitEvent>(_onInitEvent);
  }

  void _onInitEvent(InitEvent event, Emitter<MainState> emit) {
    /// TODO: implement _onInitEvent
  }
}
