import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';

import '../../data/employee.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class GetEmployeeBloc extends Bloc<GetEmployeeEvent, EmployeeState> {
  GetEmployeeBloc() : super(EmployeeInitializing()) {
    on<GetEmployeeEvent>((event, emit) async {
      try {
        emit(EmployeeLoading());
        List<Employee> employees = await ApiRepoSingleton.instance.employees();

        if (employees.isNotEmpty) {
          emit(EmployeeLoaded(employees: employees));
        } else {
          emit(EmployeeEmpty());
        }
      } catch (e) {
        emit(EmployeeError());
      }
    });
  }
}

class CreateEmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  CreateEmployeeBloc() : super(EmployeeInitializing()) {
    on<CreateEmployeeEvent>((event, emit) async {
      try {
        emit(EmployeeCreating());
        await ApiRepoSingleton.instance.createEmployee(event.employee);
        emit(EmployeeCreated());
      } catch (e) {
        emit(EmployeeError());
      }
    });
  }
}

class UpdateEmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  UpdateEmployeeBloc() : super(EmployeeInitializing()) {
    on<UpdateEmployeeEvent>((event, emit) async {
      try {
        emit(EmployeeUpdating());
        await ApiRepoSingleton.instance.updateEmployee(event.employee);
        emit(EmployeeUpdated());
      } catch (e) {
        emit(EmployeeError());
      }
    });
  }
}
