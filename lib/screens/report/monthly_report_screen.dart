import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

class MonthlyReportScreen extends StatefulWidget {
  const MonthlyReportScreen({super.key});

  @override
  State<MonthlyReportScreen> createState() => _MonthlyReportScreenState();
}

class _MonthlyReportScreenState extends State<MonthlyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2100; i++) i.toString()];
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
              value: "2024",
              items: years.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Month',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Amount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Action',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    for (int i = 1; i < 13; i++)
                      DataRow(cells: [
                        DataCell(Text(getMonth(i))),
                        DataCell(Text(showPrice(569000000))),
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
                        showPrice(28000000),
                        style: ConstTextStyles.blackF16W5,
                      )),
                      DataCell(Container()),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
