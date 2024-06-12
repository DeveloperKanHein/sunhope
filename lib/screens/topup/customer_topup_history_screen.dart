import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/topup/topup_bloc.dart';
import 'package:sunhope_computer_software/data/topup_req.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../core/show_price.dart';
import '../../data/customer.dart';
import '../../widgets/state_widgets.dart';

class CustomerTopupHistoryScreen extends StatefulWidget {
  final Customer customer;
  const CustomerTopupHistoryScreen({super.key, required this.customer});

  @override
  State<CustomerTopupHistoryScreen> createState() =>
      _CustomerTopupHistoryScreenState();
}

class _CustomerTopupHistoryScreenState
    extends State<CustomerTopupHistoryScreen> {
  final cash = TextEditingController();
  final kpay = TextEditingController();
  final _bloc = GetTopupHistoryBloc();
  final TopupBloc _topupBloc = TopupBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCustomerTopupHistoryEvent(customer: widget.customer.id ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top-Up"),
        actions: [
          SizedBox(
            width: 150,
            height: 35,
            child: InputField(
              controller: cash,
              label: 'Cash Amount',
              inputType: TextInputType.number,
              onTyping: (_) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 150,
              height: 35,
              child: InputField(
                controller: kpay,
                label: 'K-Pay Amount',
                inputType: TextInputType.number,
                onTyping: (_) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
                width: 120,
                height: 35,
                child: ElevatedButton(
                    onPressed: () {
                      final req = TopupReq();
                      req.customer = widget.customer.id ?? "";
                      req.cash = int.parse(cash.text.isEmpty ? "0" : cash.text);
                      req.kpay = int.parse(kpay.text.isEmpty ? "0" : kpay.text);
                      _topupBloc.add(FillTopupEvent(req: req));
                    },
                    child: const Text("Topup"))),
          )
        ],
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _topupBloc,
            child: BlocListener<TopupBloc, TopupState>(
              listener: (context, state) {
                if (state is TopupFilling) {
                  StateWidgets.showLoading(context);
                } else if (state is TopupFillSuccess) {
                  setState(() {
                    cash.clear();
                    kpay.clear();
                  });
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Success",
                      message: "Top-Up Complete Successfully.",
                      onPressedOK: () {
                        StateWidgets.hideLoading(context);
                        _bloc.add(GetCustomerTopupHistoryEvent(
                            customer: widget.customer.id ?? ""));
                      });
                } else if (state is TopupFillError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Fail",
                      message: "Top-Up can not be process.",
                      onPressedOK: () {
                        StateWidgets.hideLoading(context);
                      });
                }
              },
              child: BlocBuilder<TopupBloc, TopupState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetTopupHistoryBloc, TopupState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetTopupHistoryBloc, TopupState>(
                  builder: (context, state) {
                    if (state is TopupHistoryLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is TopupHistoryEmpty) {
                      return const Center(child: Text("Empty Data!"));
                    } else if (state is TopupHistoryError) {
                      return const Center(child: Text("Network Error :("));
                    } else if (state is TopupHistoryLoaded) {
                      final histories = state.histories;
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('Date',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Shop',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Customer Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Cash',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Kpay',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: [
                              for (int i = 0; i < histories.length; i++)
                                DataRow(cells: [
                                  DataCell(Text(state.histories[i].createdAt!
                                      .split("T")[0])),
                                  DataCell(Text(state.histories[i].shop == null
                                      ? ""
                                      : state.histories[i].shop!.name!)),
                                  DataCell(Text(state.histories[i].customer ==
                                          null
                                      ? ""
                                      : state.histories[i].customer!.name!)),
                                  DataCell(Text(
                                      showPrice(state.histories[i].cash ?? 0))),
                                  DataCell(Text(
                                      showPrice(state.histories[i].kpay ?? 0))),
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
    );
  }
}
