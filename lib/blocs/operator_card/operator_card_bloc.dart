import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/operator_card_model.dart';
import 'package:flutter_sha/services/operator_card_service.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is FetchOperatorCards) {
        try {
          emit(OperatorCardLoading());
          final operatorCards = await OperatorCardService().getOperatorCards();
          emit(OperatorCardSuccess(operatorCards: operatorCards));
        } catch (e) {
          emit(OperatorCardFailed(e: e.toString()));
        }
      }
    });
  }
}
