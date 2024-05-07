import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

class DateReportScreen extends StatefulWidget {
  final PageController pageController;
  final SideMenuController sideMenu;
  final int index;
  const DateReportScreen(
      {super.key,
      required this.pageController,
      required this.sideMenu,
      required this.index});

  @override
  State<DateReportScreen> createState() => _DateReportScreenState();
}

class _DateReportScreenState extends State<DateReportScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report by Date"),
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
                    final picked = await showDateRangePicker(
                      context: context,
                      lastDate: DateTime(2050),
                      firstDate: DateTime(2019),
                    );
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
                      "Start: 24/03/2024",
                      style: ConstTextStyles.blackF12W4,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "End: 24/03/2024",
                      style: ConstTextStyles.blackF12W4,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Customers',
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
                    for (int i = 1; i < 100; i++)
                      DataRow(cells: [
                        DataCell(Text("Customer - $i")),
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
