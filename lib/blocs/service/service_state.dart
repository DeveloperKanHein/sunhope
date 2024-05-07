part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  @override
  List<Object> get props => [];
}

class ServiceInitializing extends ServiceState {
  //
}

//GET
class ServiceLoading extends ServiceState {
  //
}

class ServiceLoaded extends ServiceState {
  final List<Service> services;
  ServiceLoaded({required this.services});
}

class ServiceEmpty extends ServiceState {
  //
}

//CREATE
class ServiceCreating extends ServiceState {
  //
}

class ServiceCreated extends ServiceState {
  //
}

class ServiceUpdating extends ServiceState {
  //
}

class ServiceUpdated extends ServiceState {
  //
}

class ServiceError extends ServiceState {
  //
}
