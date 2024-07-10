part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;

  const HomeState({
    this.isLoading = false,
  });

  HomeState copyWith({
    bool? isLoading,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => <Object>[
        isLoading,
      ];
}
