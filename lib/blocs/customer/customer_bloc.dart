import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/constants/const_api_routes.dart';
import 'package:sunhope_computer_software/data/customer_create_req.dart';

import '../../data/customer.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class GetCustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  GetCustomerBloc() : super(CustomerInitializing()) {
    on<CustomerEvent>((event, emit) async {
      if (event is GetCustomerEvent) {
        try {
          emit(CustomerLoading());
          List<Customer> customers =
              await ApiRepoSingleton.instance.customers();
          if (customers.isNotEmpty) {
            emit(CustomerLoaded(customers: customers));
          } else {
            emit(CustomerEmpty());
          }
        } catch (e) {
          emit(CustomerError());
        }
      } else if (event is SearchCustomerEvent) {
        try {
          emit(CustomerLoading());
          List<Customer> customers =
              await ApiRepoSingleton.instance.searchCustomers(event.name);
          if (customers.isNotEmpty) {
            emit(CustomerLoaded(customers: customers));
          } else {
            emit(CustomerEmpty());
          }
        } catch (e) {
          emit(CustomerError());
        }
      }
    });
  }
}

class CreateCustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CreateCustomerBloc() : super(CustomerInitializing()) {
    on<CreateCustomerEvent>((event, emit) async {
      try {
        emit(CustomerCreating());
        final res =
            await ApiRepoSingleton.instance.createCustomer(event.customer);
        if (res.status == ConstApiRoutes.fail) {
          emit(CustomerAlreadyExist());
        } else {
          emit(CustomerCreated());
        }
      } catch (e) {
        emit(CustomerError());
      }
    });
  }
}

class UpdateCustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  UpdateCustomerBloc() : super(CustomerInitializing()) {
    on<UpdateCustomerEvent>((event, emit) async {
      try {
        emit(CustomerUpdating());
        final res =
            await ApiRepoSingleton.instance.updateCustomer(event.customer);
        emit(CustomerUpdated());
      } catch (e) {
        emit(CustomerError());
      }
    });
  }
}
