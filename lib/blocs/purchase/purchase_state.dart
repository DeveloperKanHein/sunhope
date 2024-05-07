part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class PurchaseInitializing extends PurchaseState {
  //
}

class PurchaseCreating extends PurchaseState {
  //
}

class PurchaseCreated extends PurchaseState {
  //
}

class PurchaseError extends PurchaseState {
  //
}
