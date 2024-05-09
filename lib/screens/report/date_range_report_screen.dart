import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

import '../../widgets/state_widgets.dart';
import 'get_total.dart';

class DateRangeReportScreen extends StatefulWidget {
  const DateRangeReportScreen({super.key});

  @override
  State<DateRangeReportScreen> createState() => _DateRangeReportScreenState();
}

class _DateRangeReportScreenState extends State<DateRangeReportScreen> {
  final _bloc = GetDateRangeReportBloc();
  String startDate = "";
  String endDate = "";
  @override
  void initState() {
    super.initState();

    setState(() {
      startDate = DateTime.now().toString().split(" ")[0];
      endDate = DateTime.now().toString().split(" ")[0];
    });
    _bloc.add(GetDateRangeReportEvent(startDate: startDate, endDate: endDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report by Date Range"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () async {
                    DateTimeRange? picked = await showDateRangePicker(
                      context: context,
                      lastDate: DateTime(2050),
                      firstDate: DateTime(2019),
                    );
                    if (picked != null) {
                      startDate = picked.start.toString().split(" ")[0];
                      endDate = picked.end.toString().split(" ")[0];
                      _bloc.add(GetDateRangeReportEvent(
                          startDate: startDate, endDate: endDate));
                    }
                  },
                  icon: const Icon(
                    Icons.calendar_today,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start: $startDate",
                      style: ConstTextStyles.blackF12W4,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "End: $endDate",
                      style: ConstTextStyles.blackF12W4,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetDateRangeReportBloc, ReportState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetDateRangeReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is DateRangeReportLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ReportEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ReportError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is DateRangeReportLoaded) {
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
                                  label: Text('Amount',
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
                                  DataCell(Text("${state.data[i].id}")),
                                  DataCell(Text(showPrice(
                                      state.data[i].totalAmount ?? 0))),
                                  DataCell(InkWell(
                                    onTap: () {
                                      //
                                    },
                                    child: Text(
                                      "Detail",
                                      style: ConstTextStyles.blackF14W4Op65,
                                    ),
                                  )),
                                ]),
                              DataRow(cells: [
                                const DataCell(Text(
                                  'Total',
                                  style: ConstTextStyles.blackF16W5,
                                )),
                                DataCell(Text(
                                  showPrice(getDailyTotalAmount(state.data)),
                                  style: ConstTextStyles.blackF16W5,
                                )),
                                DataCell(Container()),
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
