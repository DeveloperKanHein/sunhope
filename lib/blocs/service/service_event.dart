part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetServiceEvent extends ServiceEvent {
  //
}

class GetServiceByCategoryEvent extends ServiceEvent {
  final String id;
  GetServiceByCategoryEvent({required this.id});
}

class CreateServiceEvent extends ServiceEvent {
  final Service service;
  CreateServiceEvent({required this.service});
}

class UpdateServiceEvent extends ServiceEvent {
  final Service service;
  UpdateServiceEvent({required this.service});
}
