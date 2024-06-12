part of 'topup_bloc.dart';

abstract class TopupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FillTopupEvent extends TopupEvent {
  final TopupReq req;
  FillTopupEvent({required this.req});
}

class GetTopupHistoryEvent extends TopupEvent {
  //
}

class GetCustomerTopupHistoryEvent extends TopupEvent {
  final String customer;
  GetCustomerTopupHistoryEvent({required this.customer});
}
