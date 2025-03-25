import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sha/models/data_plan_form_model.dart';
import 'package:flutter_sha/services/transaction_service.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is BuyDataPlan) {
        try {
          emit(DataPlanLoading());
          await TransactionService().buyDataPackage(event.data);
          emit(DataPlanSuccess());
        } catch (e) {
          emit(DataPlanFailed(e: e.toString()));
        }
      }
    });
  }
}
