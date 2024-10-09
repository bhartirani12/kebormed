import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class EmptyState extends LoginState {
  const EmptyState();
  @override
  List<Object> get props => [];
}

class AppLoginPageReadyState extends LoginState {
  final bool landingDone;

  const AppLoginPageReadyState(
    this.landingDone,
  );

  @override
  List<Object> get props => [
        landingDone,
      ];
}

class LoadingState extends LoginState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoginFailureState extends LoginState {
  final String message;

  const LoginFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
  @override
  List<Object> get props => [];
}

class NoInternetState extends LoginState {
  @override
  List<Object?> get props => [];
}
