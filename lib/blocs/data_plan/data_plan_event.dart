part of 'data_plan_bloc.dart';

sealed class DataPlanEvent extends Equatable {
  const DataPlanEvent();

  @override
  List<Object> get props => [];
}

final class BuyDataPlan extends DataPlanEvent {
  final DataPlanFormModel data;
  const BuyDataPlan({required this.data});

  @override
  List<Object> get props => [data];
}
