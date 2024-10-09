import 'package:equatable/equatable.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class EmptyState extends HomeScreenState {
  const EmptyState();
  @override
  List<Object> get props => [];
}

class HomeScreenPageReadyState extends HomeScreenState {
  final bool landingDone;

  const HomeScreenPageReadyState(
    this.landingDone,
  );

  @override
  List<Object> get props => [
        landingDone,
      ];
}

class LoadingState extends HomeScreenState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class ApiFailureState extends HomeScreenState {
  const ApiFailureState();
  @override
  List<Object> get props => [];
}

class ApiSuccessState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class NoInternetState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}
