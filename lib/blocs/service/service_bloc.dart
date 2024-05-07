import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/data/res_message.dart';

import '../../data/service.dart';

part 'service_event.dart';
part 'service_state.dart';

class GetServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  GetServiceBloc() : super(ServiceInitializing()) {
    on<ServiceEvent>((event, emit) async {
      try {
        emit(ServiceLoading());
        List<Service> services = [];
        if (event is GetServiceEvent) {
          services = await ApiRepoSingleton.instance.services();
        } else if (event is GetServiceByCategoryEvent) {
          services =
              await ApiRepoSingleton.instance.servicesByCategoryId(event.id);
        }
        if (services.isNotEmpty) {
          emit(ServiceLoaded(services: services));
        } else {
          emit(ServiceEmpty());
        }
      } catch (e) {
        emit(ServiceError());
      }
    });
  }
}

class CreateServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  CreateServiceBloc() : super(ServiceInitializing()) {
    on<CreateServiceEvent>((event, emit) async {
      try {
        emit(ServiceCreating());
        ResMessage res =
            await ApiRepoSingleton.instance.createService(event.service);
        emit(ServiceCreated());
      } catch (e) {
        emit(ServiceError());
      }
    });
  }
}

class UpdateServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  UpdateServiceBloc() : super(ServiceInitializing()) {
    on<UpdateServiceEvent>((event, emit) async {
      try {
        emit(ServiceUpdating());
        ResMessage res =
            await ApiRepoSingleton.instance.updateService(event.service);
        emit(ServiceUpdated());
      } catch (e) {
        emit(ServiceError());
      }
    });
  }
}
