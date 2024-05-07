import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/constants/const_colors.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';

import '../../data/purchase.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({super.key});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  List<Purchase>? reports;
  @override
  void initState() {
    super.initState();
    ApiRepoSingleton.instance.report().then((data) {
      setState(() {
        reports = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Report Detail"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, color: ConstColors.borderColor),
                    Text("Ko Kan Hein", style: ConstTextStyles.blackF14W4Op45),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(Icons.phone, color: ConstColors.borderColor),
                    Text("09400957006", style: ConstTextStyles.blackF14W4Op45),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(Icons.account_balance_wallet,
                        color: ConstColors.borderColor),
                    const SizedBox(width: 4),
                    Text(showPrice(500000),
                        style: ConstTextStyles.blackF14W4Op45),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    const Icon(Icons.fingerprint,
                        color: ConstColors.borderColor),
                    const SizedBox(width: 4),
                    Text("da39a3ee5e6b4b0d3255bfef",
                        style: ConstTextStyles.blackF14W4Op45),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Service',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Discount',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Price',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('FOC',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    for (int i = 1; i < 8; i++)
                      DataRow(cells: [
                        DataCell(Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Service - $i'),
                            Text('服務 - $i'),
                          ],
                        )),
                        DataCell(Text(showPrice(int.parse('${i}000')))),
                        DataCell(Text(showPrice(int.parse('${i}0000')))),
                        DataCell(Icon(i % 2 == 0
                            ? Icons.check_box_outline_blank
                            : Icons.check_box_outlined)),
                      ]),
                    DataRow(cells: [
                      const DataCell(Text(
                        'Total',
                        style: ConstTextStyles.blackF16W5,
                      )),
                      DataCell(Container()),
                      DataCell(Text(
                        showPrice(280000),
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
