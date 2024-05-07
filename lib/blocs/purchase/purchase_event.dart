part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreatePurchaseEvent extends PurchaseEvent {
  final Purchase purchase;
  CreatePurchaseEvent({required this.purchase});
}
