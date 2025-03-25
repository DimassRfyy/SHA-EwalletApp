import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/transaction_model.dart';
import 'package:flutter_sha/services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is FetchTransactions) {
        try {
          emit(TransactionLoading());
          final data = await TransactionService().getTransactions();
          emit(TransactionSuccess(data));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
