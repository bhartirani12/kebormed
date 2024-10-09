import 'package:equatable/equatable.dart';

abstract class UserDetailScreenState extends Equatable {
  const UserDetailScreenState();
}

class EmptyState extends UserDetailScreenState {
  const EmptyState();
  @override
  List<Object> get props => [];
}

class NoInternetState extends UserDetailScreenState {
  @override
  List<Object?> get props => [];
}
