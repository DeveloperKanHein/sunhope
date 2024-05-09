import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/report/daily_report_detail_screen.dart';
import 'package:sunhope_computer_software/screens/report/get_total.dart';

import '../../widgets/state_widgets.dart';

class DailyReportScreen extends StatefulWidget {
  final int? year;
  final int? month;
  const DailyReportScreen({super.key, this.year, this.month});

  @override
  State<DailyReportScreen> createState() => _DailyReportScreenState();
}

class _DailyReportScreenState extends State<DailyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2050; i++) i.toString()];
  final _bloc = GetDailyReportBloc();
  int year = 2024;
  int month = 1;
  String monthName = "January";
  String getMonth(int monthNumber) {
    late String month;
    switch (monthNumber) {
      case 1:
        month = "January";
        break;
      case 2:
        month = "February";
        break;
      case 3:
        month = "March";
        break;
      case 4:
        month = "April";
        break;
      case 5:
        month = "May";
        break;
      case 6:
        month = "June";
        break;
      case 7:
        month = "July";
        break;
      case 8:
        month = "August";
        break;
      case 9:
        month = "September";
        break;
      case 10:
        month = "October";
        break;
      case 11:
        month = "November";
        break;
      case 12:
        month = "December";
        break;
    }
    return month;
  }

  List<String> months = [];
  @override
  void initState() {
    super.initState();
    for (int i = 1; i < 13; i++) {
      months.add(getMonth(i));
    }
    if (widget.year != null && widget.month != null) {
      setState(() {
        year = widget.year ?? 2024;
        int paramMonth = widget.month ?? 1;
        month = paramMonth - 1;
        monthName = months[month];
      });
    }
    _bloc.add(GetDailyReportEvent(year: year, month: month));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Report"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  focusColor: Colors.transparent,
                  value: "$year",
                  items: years.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        year = int.parse(newValue);
                      });
                      _bloc.add(GetDailyReportEvent(year: year, month: month));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  focusColor: Colors.transparent,
                  value: monthName,
                  items: months.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        month = months.indexOf(newValue);
                        monthName = months[month];
                      });
                      _bloc.add(GetDailyReportEvent(year: year, month: month));
                    }
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetDailyReportBloc, ReportState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetDailyReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is DailyReportLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ReportEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ReportError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is DailyReportLoaded) {
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('Daily',
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
                              for (int i = 0;
                                  i < state.dailyReports.length;
                                  i++)
                                DataRow(cells: [
                                  DataCell(Text("${state.dailyReports[i].id}")),
                                  DataCell(Text(showPrice(
                                      state.dailyReports[i].totalAmount ?? 0))),
                                  DataCell(InkWell(
                                    onTap: () {
                                      nextStfScreen(
                                          context: context,
                                          screen: DailyDetailReportScreen(
                                              type: 'date',
                                              data:
                                                  "${state.dailyReports[i].id}"));
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
                                  showPrice(
                                      getDailyTotalAmount(state.dailyReports)),
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
