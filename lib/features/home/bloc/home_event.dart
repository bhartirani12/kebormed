import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class HomePageReadyEvent extends HomeScreenEvent {
  @override
  List<Object> get props => [];
}

class FetchHomeScreenListEvent extends HomeScreenEvent {
  const FetchHomeScreenListEvent();
  @override
  List<Object> get props => [];
}

class ApiFailureEvent extends HomeScreenEvent {
  const ApiFailureEvent();
  @override
  List<Object> get props => [];
}

class ApiSuccessEvent extends HomeScreenEvent {
  const ApiSuccessEvent();
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends HomeScreenEvent {
  @override
  List<Object> get props => [];
}
