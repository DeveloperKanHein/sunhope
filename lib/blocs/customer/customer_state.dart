part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  @override
  List<Object> get props => [];
}

class CustomerInitializing extends CustomerState {
  //
}

//GET
class CustomerLoading extends CustomerState {
  //
}

class CustomerLoaded extends CustomerState {
  final List<Customer> customers;
  CustomerLoaded({required this.customers});
}

class CustomerEmpty extends CustomerState {
  //
}

//CREATE
class CustomerCreating extends CustomerState {
  //
}

class CustomerCreated extends CustomerState {
  //
}

class CustomerUpdating extends CustomerState {
  //
}

class CustomerUpdated extends CustomerState {
  //
}

class CustomerAlreadyExist extends CustomerState {
  //
}

class CustomerError extends CustomerState {
  //
}
