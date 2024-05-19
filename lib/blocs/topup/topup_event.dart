part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FillTopupEvent extends TopupEvent {
  final String customerId;
  final int amount;
  FillTopupEvent({required this.customerId, required this.amount});
}
