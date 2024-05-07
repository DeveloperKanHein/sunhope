part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetEmployeeEvent extends EmployeeEvent {
  //
}

class CreateEmployeeEvent extends EmployeeEvent {
  final Employee employee;
  CreateEmployeeEvent({required this.employee});
}

class UpdateEmployeeEvent extends EmployeeEvent {
  final Employee employee;
  UpdateEmployeeEvent({required this.employee});
}
