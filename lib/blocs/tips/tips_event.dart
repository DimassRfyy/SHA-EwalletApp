part of 'tips_bloc.dart';

sealed class TipsEvent extends Equatable {
  const TipsEvent();

  @override
  List<Object> get props => [];
}

final class GetTips extends TipsEvent {}
