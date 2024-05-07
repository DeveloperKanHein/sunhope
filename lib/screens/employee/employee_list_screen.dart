import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/employee/employee_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/screens/employee/widgets/employee_create_form.dart';
import 'package:sunhope_computer_software/screens/employee/widgets/employee_edit_form.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../data/employee.dart';
import '../../widgets/input_field.dart';

class EmployeeeeListScreen extends StatefulWidget {
  const EmployeeeeListScreen({super.key});

  @override
  State<EmployeeeeListScreen> createState() => _EmployeeeeListScreenState();
}

class _EmployeeeeListScreenState extends State<EmployeeeeListScreen> {
  final _search = TextEditingController();
  final GetEmployeeBloc _getEmployeeBloc = GetEmployeeBloc();
  final CreateEmployeeBloc _createEmployeeBloc = CreateEmployeeBloc();
  final UpdateEmployeeBloc _updateEmployeeBloc = UpdateEmployeeBloc();

  @override
  void initState() {
    super.initState();
    _getEmployeeBloc.add(GetEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: SizedBox(
        //         width: 200,
        //         height: 50,
        //         child: InputField(
        //           controller: _search,
        //           label: "Search",
        //           onTyping: (_) {},
        //           suffixWidget: InkWell(
        //             onTap: () {
        //               // _getEmployeeBloc
        //               //     .add(SearchEmployeeEvent(name: _search.text));
        //             },
        //             child: const Icon(
        //               Icons.search,
        //               size: 24,
        //             ),
        //           ),
        //         )),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _createEmployeeBloc,
            child: BlocListener<CreateEmployeeBloc, EmployeeState>(
              listener: (context, state) {
                if (state is EmployeeCreating) {
                  StateWidgets.showLoading(context);
                } else if (state is EmployeeCreated) {
                  StateWidgets.hideLoading(context);
                  _getEmployeeBloc.add(GetEmployeeEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "New employee is created successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is EmployeeError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "New employee can not be created!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<CreateEmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _updateEmployeeBloc,
            child: BlocListener<UpdateEmployeeBloc, EmployeeState>(
              listener: (context, state) {
                if (state is EmployeeUpdating) {
                  StateWidgets.showLoading(context);
                } else if (state is EmployeeUpdated) {
                  StateWidgets.hideLoading(context);
                  _getEmployeeBloc.add(GetEmployeeEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "Employee is updated successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is EmployeeError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "Employee can not be updated!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<UpdateEmployeeBloc, EmployeeState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _getEmployeeBloc,
              child: BlocListener<GetEmployeeBloc, EmployeeState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetEmployeeBloc, EmployeeState>(
                  builder: (context, state) {
                    if (state is EmployeeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is EmployeeEmpty) {
                      return const Center(child: Text("Empty Data!"));
                    } else if (state is EmployeeError) {
                      return const Center(child: Text("Network Error :("));
                    } else if (state is EmployeeLoaded) {
                      final employees = state.employees;
                      return ListView(
                        children: [
                          DataTable(
                            dataRowMinHeight: 30,
                            dataRowMaxHeight: 80,
                            columns: const [
                              DataColumn(
                                  label: Text('No.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Phone',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Role',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('ID',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Nickname',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Action',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: [
                              for (int i = 0; i < employees.length; i++)
                                DataRow(
                                    // color: MaterialStateProperty.all(
                                    //     getColor(50000)),
                                    cells: [
                                      DataCell(Text('${i + 1}')),
                                      DataCell(Text(employees[i].name ?? "")),
                                      DataCell(Text(employees[i]
                                          .phone!
                                          .replaceAll(",", "\n"))),
                                      DataCell(Text(employees[i].role ?? "")),
                                      DataCell(
                                          Text(employees[i].employeeID ?? "")),
                                      DataCell(
                                          Text(employees[i].nickname ?? "")),
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (_) =>
                                                        EmployeeEditForm(
                                                          employee:
                                                              employees[i],
                                                          onUpdate: (Employee
                                                              employee) {
                                                            _updateEmployeeBloc.add(
                                                                UpdateEmployeeEvent(
                                                                    employee:
                                                                        employee));
                                                          },
                                                        ));
                                              },
                                              child: const Text(
                                                "Edit",
                                                style:
                                                    ConstTextStyles.blueF14W4,
                                              )),
                                          // const SizedBox(width: 15),
                                          // InkWell(
                                          //     onTap: () {},
                                          //     child: Text(
                                          //       "Detail",
                                          //       style: ConstTextStyles
                                          //           .blackF14W4Op65,
                                          //     )),
                                        ],
                                      )),
                                    ]),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => EmployeeCreateForm(
                    onCreate: (Employee employee) {
                      _createEmployeeBloc
                          .add(CreateEmployeeEvent(employee: employee));
                    },
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
