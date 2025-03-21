part of 'topup_bloc.dart';

sealed class TopupEvent extends Equatable {
  const TopupEvent();

  @override
  List<Object> get props => [];
}

final class TopupPost extends TopupEvent {
  final TopupFormModel data;
  const TopupPost({required this.data});

  @override
  List<Object> get props => [data];
}
