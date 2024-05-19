import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/employee/employee_bloc.dart';
import '../../../constants/const_colors.dart';
import '../../../data/employee.dart';
import '../../../widgets/state_widgets.dart';

class EmployeeDropdownWidget extends StatefulWidget {
  String? employeeId;
  final Function(Employee?) onChoose;
  EmployeeDropdownWidget({super.key, required this.onChoose, this.employeeId});

  @override
  State<EmployeeDropdownWidget> createState() => _EmployeeDropdownWidgetState();
}

class _EmployeeDropdownWidgetState extends State<EmployeeDropdownWidget> {
  final _bloc = GetEmployeeBloc();
  List<Employee> _employees = [];
  Employee? employee;
  String? employeeId;

  String? getNameById(String? id) {
    for (int i = 0; i < _employees.length; i++) {
      if (_employees[i].id == id) {
        return _employees[i].name;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(GetEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<GetEmployeeBloc, EmployeeState>(
        listener: (context, state) {
          if (state is EmployeeLoaded) {
            _employees = state.employees;
            if (state.employees.isNotEmpty) {
              if (widget.employeeId == null) {
                widget.onChoose(state.employees[0]);
                setState(() {
                  employeeId = state.employees[0].id;
                });
              } else {
                for (Employee employee in state.employees) {
                  if (widget.employeeId == employee.id) {
                    widget.onChoose(employee);
                    setState(() {
                      employeeId = employee.id;
                    });
                  }
                }
              }
            }
          }
        },
        child: BlocBuilder<GetEmployeeBloc, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeLoading) {
              return StateWidgets.loadingWidget;
            } else if (state is EmployeeEmpty) {
              return StateWidgets.emptyWidget;
            } else if (state is EmployeeError) {
              return StateWidgets.networkErrorWidget;
            } else if (state is EmployeeLoaded) {
              return Container(
                height: 30,
                width: 200,
                // decoration: BoxDecoration(
                //   border: Border.all(color: ConstColors.borderColor),
                //   borderRadius: BorderRadius.circular(5),
                // ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Employee>(
                    focusColor: Colors.transparent,
                    isExpanded: true,
                    elevation: 8,
                    value: employee,
                    alignment: AlignmentDirectional.bottomStart,
                    items: state.employees.map((Employee employee) {
                      return DropdownMenuItem(
                        value: employee,
                        child: Text(employee.name ?? ""),
                      );
                    }).toList(),
                    onChanged: (cat) {
                      widget.onChoose(cat);
                      setState(() {
                        employee = cat;
                      });
                    },
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
