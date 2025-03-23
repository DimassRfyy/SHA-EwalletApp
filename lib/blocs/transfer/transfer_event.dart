part of 'transfer_bloc.dart';

sealed class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

final class Transfer extends TransferEvent {
  final TransferFormModel data;
  const Transfer({required this.data});

  @override
  List<Object> get props => [data];
}
