part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class GetUserByUsername extends UserEvent {
  final String username;
  const GetUserByUsername({required this.username});

  @override
  List<Object> get props => [username];
}

final class GetRecentUsers extends UserEvent {}
