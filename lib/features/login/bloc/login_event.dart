import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPageReadyEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final String username;
  final String password;
  const UserLoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class UpdateRememberMeEvent extends LoginEvent {
  final bool isRemembered;

  const UpdateRememberMeEvent({required this.isRemembered});
  @override
  List<Object> get props => [isRemembered];
}

class LoginFailureEvent extends LoginEvent {
  const LoginFailureEvent();
  @override
  List<Object> get props => [];
}

class LoginSuccessEvent extends LoginEvent {
  const LoginSuccessEvent();
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
