import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class EmptyState extends LoginState {
  const EmptyState();
  @override
  List<Object> get props => [];
}

class LoginPageReadyState extends LoginState {
  final bool landingDone;

  const LoginPageReadyState(
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

class UpdateRememberMeState extends LoginState {
  final bool isRemembered;

  const UpdateRememberMeState(
    this.isRemembered,
  );

  @override
  List<Object> get props => [
        isRemembered,
      ];
}

class LoginFailureState extends LoginState {
  const LoginFailureState();
  @override
  List<Object> get props => [];
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
