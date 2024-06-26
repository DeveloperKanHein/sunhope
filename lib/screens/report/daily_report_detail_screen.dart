import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/report/get_total.dart';
import 'package:sunhope_computer_software/screens/report/report_detail_screen.dart';

import '../../widgets/state_widgets.dart';

class DailyDetailReportScreen extends StatefulWidget {
  final String data;
  final String type;
  const DailyDetailReportScreen(
      {super.key, required this.data, required this.type});

  @override
  State<DailyDetailReportScreen> createState() =>
      _DailyDetailReportScreenState();
}

class _DailyDetailReportScreenState extends State<DailyDetailReportScreen> {
  final _bloc = GetDetailReportBloc();

  @override
  void initState() {
    super.initState();
    if (widget.type == 'customer') {
      _bloc.add(GetDetailByCustomerReportEvent(id: widget.data));
    } else if (widget.type == 'employee') {
      _bloc.add(GetDetailByEmployeeReportEvent(id: widget.data));
    } else if (widget.type == 'date') {
      _bloc.add(GetDetailReportEvent(date: widget.data));
    } else {
      _bloc.add(GetDetailReportEvent(date: widget.data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.type == 'date'
            ? Text("Report of ${widget.data}")
            : const Text("History"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetDetailReportBloc, ReportState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetDetailReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is DetailReportLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ReportEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ReportError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is DetailReportLoaded) {
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
                                  label: Text('Amount',
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
                              for (int i = 0; i < state.data.length; i++)
                                DataRow(cells: [
                                  DataCell(Text(
                                      state.data[i].createdAt!.split("T")[0])),
                                  DataCell(Text(state.data[i].shop == null
                                      ? ""
                                      : state.data[i].shop!.name!)),
                                  DataCell(Text(
                                      "${state.data[i].customerId!.no}. ${state.data[i].customerName}")),
                                  DataCell(Text(showPrice(
                                      state.data[i].totalAmount ?? 0))),
                                  DataCell(
                                      Text(showPrice(state.data[i].cash ?? 0))),
                                  DataCell(
                                      Text(showPrice(state.data[i].kpay ?? 0))),
                                  DataCell(Text(
                                      showPrice(state.data[i].balance ?? 0))),
                                  DataCell(InkWell(
                                    onTap: () {
                                      nextStfScreen(
                                          context: context,
                                          screen: ReportDetailScreen(
                                              id: "${state.data[i].id}"));
                                    },
                                    child: Text(
                                      "Detail",
                                      style: ConstTextStyles.blackF14W4Op65,
                                    ),
                                  )),
                                ]),
                              // DataRow(cells: [
                              //   DataCell(Container()),
                              //   DataCell(Container()),
                              //   const DataCell(Text(
                              //     'Total',
                              //     style: ConstTextStyles.blackF16W5,
                              //   )),
                              //   DataCell(Text(
                              //     showPrice(getPurchaseTotalAmount(state.data)),
                              //     style: ConstTextStyles.blackF16W5,
                              //   )),
                              //   DataCell(Container()),
                              //   DataCell(Container()),
                              // ]),
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
