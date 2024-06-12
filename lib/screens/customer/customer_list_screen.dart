import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/customer/customer_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/screens/customer/widgets/customer_create_form.dart';
import 'package:sunhope_computer_software/screens/customer/widgets/customer_edit_form.dart';
import 'package:sunhope_computer_software/screens/topup/customer_topup_history_screen.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../core/next_screen.dart';
import '../../data/customer.dart';
import '../../widgets/input_field.dart';
import '../report/daily_report_detail_screen.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final _search = TextEditingController();
  final GetCustomerBloc _getCustomerBloc = GetCustomerBloc();
  final CreateCustomerBloc _createCustomerBloc = CreateCustomerBloc();
  final UpdateCustomerBloc _updateCustomerBloc = UpdateCustomerBloc();

  Color getColor(int balance) {
    if (balance <= 10000) {
      return Colors.red.withOpacity(0.8);
    } else if (balance > 10000 && balance <= 30000) {
      return Colors.orange.withOpacity(0.8);
    } else {
      return Colors.white;
    }
  }

  @override
  void initState() {
    super.initState();
    _getCustomerBloc.add(GetCustomerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers"),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
                width: 200,
                height: 50,
                child: InputField(
                  controller: _search,
                  label: "Search",
                  onTyping: (_) {},
                  onSubmitted: (_) {
                    _getCustomerBloc
                        .add(SearchCustomerEvent(name: _search.text));
                  },
                  suffixWidget: InkWell(
                    onTap: () {
                      _getCustomerBloc
                          .add(SearchCustomerEvent(name: _search.text));
                    },
                    child: const Icon(
                      Icons.search,
                      size: 24,
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _createCustomerBloc,
            child: BlocListener<CreateCustomerBloc, CustomerState>(
              listener: (context, state) {
                if (state is CustomerCreating) {
                  StateWidgets.showLoading(context);
                } else if (state is CustomerCreated) {
                  StateWidgets.hideLoading(context);
                  _getCustomerBloc.add(GetCustomerEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "New customer is created successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is CustomerError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "New customer can not be created!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is CustomerAlreadyExist) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Fail",
                      message: "Customer already exist!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<CreateCustomerBloc, CustomerState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _updateCustomerBloc,
            child: BlocListener<UpdateCustomerBloc, CustomerState>(
              listener: (context, state) {
                if (state is CustomerUpdating) {
                  StateWidgets.showLoading(context);
                } else if (state is CustomerUpdated) {
                  StateWidgets.hideLoading(context);
                  _getCustomerBloc.add(GetCustomerEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "Customer is updated successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is CustomerError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "Customer can not be updated!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<UpdateCustomerBloc, CustomerState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _getCustomerBloc,
              child: BlocListener<GetCustomerBloc, CustomerState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetCustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is CustomerLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CustomerEmpty) {
                      return const Center(child: Text("Empty Data!"));
                    } else if (state is CustomerError) {
                      return const Center(child: Text("Network Error :("));
                    } else if (state is CustomerLoaded) {
                      final customers = state.customers;
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
                                  label: Text('Balance',
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
                              for (int i = 0; i < customers.length; i++)
                                DataRow(
                                    color: MaterialStateProperty.all(
                                        getColor(customers[i].balance ?? 0)),
                                    cells: [
                                      DataCell(Text('${i + 1}')),
                                      DataCell(Text(
                                          "${customers[i].no}. ${customers[i].name}")),
                                      DataCell(Text(customers[i]
                                          .phone!
                                          .replaceAll(",", "\n"))),
                                      DataCell(Text(
                                          customers[i].balance.toString())),
                                      // DataCell(Text(customers[i].remark ?? "")),
                                      DataCell(Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (_) =>
                                                        CustomerEditForm(
                                                          customer:
                                                              customers[i],
                                                          onUpdate: (Customer
                                                              customer) {
                                                            _updateCustomerBloc.add(
                                                                UpdateCustomerEvent(
                                                                    customer:
                                                                        customer));
                                                          },
                                                        ));
                                              },
                                              child: const Text(
                                                "Edit",
                                                style:
                                                    ConstTextStyles.blueF14W4,
                                              )),
                                          const SizedBox(width: 15),
                                          InkWell(
                                              onTap: () {
                                                nextStfScreen(
                                                    context: context,
                                                    screen:
                                                        CustomerTopupHistoryScreen(
                                                      customer: customers[i],
                                                    ));
                                              },
                                              child: Text(
                                                "Topup",
                                                style: ConstTextStyles
                                                    .blackF14W4Op65,
                                              )),
                                          const SizedBox(width: 15),
                                          InkWell(
                                              onTap: () {
                                                nextStfScreen(
                                                    context: context,
                                                    screen: DailyDetailReportScreen(
                                                        type: 'customer',
                                                        data:
                                                            "${customers[i].id}"));
                                              },
                                              child: Text(
                                                "Detail",
                                                style: ConstTextStyles
                                                    .blackF14W4Op65,
                                              )),
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
              builder: (_) => CustomerCreateForm(
                    onCreate: (customer) {
                      _createCustomerBloc
                          .add(CreateCustomerEvent(customer: customer));
                    },
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
