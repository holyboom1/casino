part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {}

class InitEvent extends SplashEvent {
  @override
  List<Object?> get props => <Object?>[];
}
