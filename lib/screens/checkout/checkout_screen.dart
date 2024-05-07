import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/constants/const_colors.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/checkout/check_out_process_screen.dart';
import 'package:sunhope_computer_software/screens/checkout/finger_scan_widget.dart';

import '../../blocs/service/service_bloc.dart';
import '../../core/checkout_service_handler/checkout_service_handler.dart';
import '../../data/service.dart';
import '../../data/service_req.dart';
import '../../widgets/input_field.dart';
import '../../widgets/state_widgets.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _searchCustomer = TextEditingController();
  final _searchService = TextEditingController();
  final GetServiceBloc _getServiceBloc = GetServiceBloc();
  bool isProcess = false;
  @override
  void initState() {
    super.initState();
    _getServiceBloc.add(GetServiceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: isProcess
          ? CheckOutProcessScreen(
              close: (cls) {
                setState(() {
                  isProcess = false;
                });
              },
            )
          : BlocProvider(
              create: (_) => _getServiceBloc,
              child: BlocListener<GetServiceBloc, ServiceState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetServiceBloc, ServiceState>(
                  builder: (context, state) {
                    if (state is ServiceLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ServiceEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ServiceError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is ServiceLoaded) {
                      final services = state.services;
                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                DataTable(
                                  columns: const [
                                    DataColumn(
                                        label: Text('Select',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Service',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Price',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Discount',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                  rows: [
                                    for (int i = 0; i < services.length; i++)
                                      DataRow(cells: [
                                        DataCell(
                                            // _selectedServices.contains(services[i])
                                            CheckoutServiceHandler.checkExist(
                                                    services[i])
                                                ? InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        CheckoutServiceHandler
                                                            .remove(
                                                                services[i]);
                                                        // _selectedServices.remove(services[i]);
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.check_box))
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        CheckoutServiceHandler
                                                            .addToCart(
                                                                services[i]);
                                                        // _selectedServices
                                                        //     .add(services[i]);
                                                        // CheckoutServiceHandler
                                                        //     .services
                                                        //     .add(services[i]
                                                        //         .toReq());
                                                      });
                                                    },
                                                    child: const Icon(Icons
                                                        .check_box_outline_blank))),
                                        DataCell(Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(services[i].name ?? ""),
                                            Text(services[i].nameCN ?? ""),
                                          ],
                                        )),
                                        DataCell(Text(
                                            showPrice(services[i].price ?? 0))),
                                        DataCell(Text(showPrice(
                                            services[i].discount ?? 0))),
                                      ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isProcess = true;
                                      });
                                    },
                                    child: const Icon(Icons.arrow_forward)),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
    );
  }
}
