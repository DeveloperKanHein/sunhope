import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/report/monthly_report_screen.dart';

import '../../widgets/state_widgets.dart';

class YearlyReportScreen extends StatefulWidget {
  const YearlyReportScreen({super.key});

  @override
  State<YearlyReportScreen> createState() => _YearlyReportScreenState();
}

class _YearlyReportScreenState extends State<YearlyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2100; i++) i.toString()];
  final _bloc = GetYearlyReportBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetYearlyReportEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yearly Report"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: DropdownButton(
          //     icon: const Icon(Icons.keyboard_arrow_down),
          //     focusColor: Colors.transparent,
          //     value: "2024",
          //     items: years.map((String items) {
          //       return DropdownMenuItem(
          //         value: items,
          //         child: Text(items),
          //       );
          //     }).toList(),
          //     onChanged: (String? newValue) {
          //       setState(() {});
          //     },
          //   ),
          // ),

          Expanded(
            child: BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetYearlyReportBloc, ReportState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetYearlyReportBloc, ReportState>(
                  builder: (context, state) {
                    if (state is YearlyReportLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is ReportEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is ReportError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is YearlyReportLoaded) {
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('Year',
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
                                  i < state.yearlyReports.length;
                                  i++)
                                DataRow(cells: [
                                  DataCell(Text(
                                      '${state.yearlyReports[i].yearlyID!.year}')),
                                  DataCell(Text(showPrice(
                                      state.yearlyReports[i].totalAmount ??
                                          0))),
                                  DataCell(Text(showPrice(
                                      state.yearlyReports[i].cash ?? 0))),
                                  DataCell(Text(showPrice(
                                      state.yearlyReports[i].kpay ?? 0))),
                                  DataCell(InkWell(
                                    onTap: () {
                                      nextStfScreen(
                                          context: context,
                                          screen: MonthlyReportScreen(
                                            year: state.yearlyReports[i]
                                                .yearlyID!.year!,
                                          ));
                                    },
                                    child: Text(
                                      "Detail",
                                      style: ConstTextStyles.blackF14W4Op65,
                                    ),
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
    );
  }
}
