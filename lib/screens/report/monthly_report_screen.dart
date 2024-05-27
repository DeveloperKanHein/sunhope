import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/report/daily_report_screen.dart';

import '../../widgets/state_widgets.dart';
import 'get_total.dart';

class MonthlyReportScreen extends StatefulWidget {
  final int? year;
  const MonthlyReportScreen({super.key, this.year});

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2100; i++) i.toString()];
  final _bloc = GetMonthlyReportBloc();
  int year = 2024;
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

  @override
  void initState() {
    super.initState();
    if (widget.year != null) {
      setState(() {
        year = widget.year ?? 2024;
      });
    }
    _bloc.add(GetMonthlyReportEvent(year: 2024));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Report"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    _bloc.add(GetMonthlyReportEvent(year: year));
                  });
                }
              },
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetMonthlyReportBloc, ReportState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetMonthlyReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is MonthlyReportLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ReportEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ReportError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is MonthlyReportLoaded) {
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('Month',
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
                                  label: Text('Action',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                            rows: [
                              for (int i = 0;
                                  i < state.monthlyReports.length;
                                  i++)
                                DataRow(cells: [
                                  DataCell(Text(getMonth(state
                                          .monthlyReports[i].monthlyID!.month ??
                                      1))),
                                  DataCell(Text(showPrice(
                                      state.monthlyReports[i].totalAmount ??
                                          0))),
                                  DataCell(Text(showPrice(
                                      state.monthlyReports[i].cash ?? 0))),
                                  DataCell(Text(showPrice(
                                      state.monthlyReports[i].kpay ?? 0))),
                                  DataCell(InkWell(
                                    onTap: () {
                                      nextStfScreen(
                                          context: context,
                                          screen: DailyReportScreen(
                                            year: state.monthlyReports[i]
                                                    .monthlyID!.year ??
                                                2024,
                                            month: state.monthlyReports[i]
                                                    .monthlyID!.month ??
                                                1,
                                          ));
                                    },
                                    child: Text(
                                      "Detail",
                                      style: ConstTextStyles.blackF14W4Op65,
                                    ),
                                  )),
                                ]),
                              // DataRow(cells: [
                              //   const DataCell(Text(
                              //     'Total',
                              //     style: ConstTextStyles.blackF16W5,
                              //   )),
                              //   DataCell(Text(
                              //     showPrice(getMonthlyTotalAmount(
                              //         state.monthlyReports)),
                              //     style: ConstTextStyles.blackF16W5,
                              //   )),
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
