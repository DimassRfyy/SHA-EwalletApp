import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/topup_form_model.dart';
import 'package:flutter_sha/services/transaction_service.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {
      if (event is TopupPost) {
        try {
          emit(TopupLoading());
          final res = await TransactionService().topUp(event.data);
          emit(TopupSuccess(redirectUrl: res));
        } catch (e) {
          emit(TopupFailed(e: e.toString()));
        }
      }
    });
  }
}
