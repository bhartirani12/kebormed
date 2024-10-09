import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class AppLoginPageReadyEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class UserLoginEvent extends LoginEvent {
  final String username;
  final String password;
  const UserLoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [];
}

class LoadCredentials extends LoginEvent {
  const LoadCredentials();

  @override
  List<Object?> get props => [];
}

class ApiFailureEvent extends LoginEvent {
  final String message;

  const ApiFailureEvent({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}

class ApiSuccessEvent extends LoginEvent {
  const ApiSuccessEvent();
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
