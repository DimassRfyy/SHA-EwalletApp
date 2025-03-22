import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserByUsername) {
        try {
          emit(UserLoading());
          final res = await UserService().getUsersByUsername(event.username);
          emit(UserSuccess(users: res));
        } catch (e) {
          emit(UserFailed(e: e.toString()));
        }
      }

      if (event is GetRecentUsers) {
        try {
          emit(UserLoading());
          final res = await UserService().getRecentUsers();
          emit(UserSuccess(users: res));
        } catch (e) {
          emit(UserFailed(e: e.toString()));
        }
      }
    });
  }
}
