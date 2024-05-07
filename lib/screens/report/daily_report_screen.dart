import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

class DailyReportScreen extends StatefulWidget {
  final PageController pageController;
  final SideMenuController sideMenu;
  final int index;
  const DailyReportScreen(
      {super.key,
      required this.pageController,
      required this.sideMenu,
      required this.index});

  @override
  State<DailyReportScreen> createState() => _DailyReportScreenState();
}

class _DailyReportScreenState extends State<DailyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2050; i++) i.toString()];
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: DropdownButton(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  focusColor: Colors.transparent,
                  value: months[0],
                  items: months.map((String items) {
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
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Daily',
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
                    for (int i = 1; i < 32; i++)
                      DataRow(cells: [
                        DataCell(Text("$i/03/2024")),
                        DataCell(Text(showPrice(3520000))),
                        DataCell(InkWell(
                          onTap: () {
                            widget.sideMenu.changePage(widget.index);
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
