part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCustomerEvent extends CustomerEvent {
  //
}

class SearchCustomerEvent extends CustomerEvent {
  final String name;
  SearchCustomerEvent({required this.name});
}

class CreateCustomerEvent extends CustomerEvent {
  final Customer customer;
  CreateCustomerEvent({required this.customer});
}

class UpdateCustomerEvent extends CustomerEvent {
  final Customer customer;
  UpdateCustomerEvent({required this.customer});
}
