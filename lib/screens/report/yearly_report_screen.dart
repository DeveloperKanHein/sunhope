import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

class YearlyReportScreen extends StatefulWidget {
  const YearlyReportScreen({super.key});

  @override
  State<YearlyReportScreen> createState() => _YearlyReportScreenState();
}

class _YearlyReportScreenState extends State<YearlyReportScreen> {
  List<String> years = [for (int i = 2024; i < 2100; i++) i.toString()];

  @override
  void initState() {
    super.initState();
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
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Year',
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
                    for (int i = 2024; i < 2050; i++)
                      DataRow(cells: [
                        DataCell(Text('$i')),
                        DataCell(Text(showPrice(58700000000))),
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
