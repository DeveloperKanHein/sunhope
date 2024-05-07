part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmployeeInitializing extends EmployeeState {
  //
}

//GET
class EmployeeLoading extends EmployeeState {
  //
}

class EmployeeLoaded extends EmployeeState {
  final List<Employee> employees;
  EmployeeLoaded({required this.employees});
}

class EmployeeEmpty extends EmployeeState {
  //
}

//CREATE
class EmployeeCreating extends EmployeeState {
  //
}

class EmployeeCreated extends EmployeeState {
  //
}

class EmployeeUpdating extends EmployeeState {
  //
}

class EmployeeUpdated extends EmployeeState {
  //
}

class EmployeeError extends EmployeeState {
  //
}
