import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/blocs/report/report_bloc.dart';
import 'package:sunhope_computer_software/constants/const_colors.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/data/purchase_detail.dart';
import 'package:sunhope_computer_software/data/purchased_service.dart';

import '../../data/purchase.dart';
import '../../data/service.dart';
import '../../widgets/state_widgets.dart';

class ReportDetailScreen extends StatefulWidget {
  final String id;
  const ReportDetailScreen({super.key, required this.id});

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  PurchaseDetail? detail;
  List<PurchasedService> services = [];
  @override
  void initState() {
    super.initState();
    ApiRepoSingleton.instance.purchaseById(widget.id).then((data) {
      setState(() {
        detail = data;
        services.addAll(data.services ?? []);
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
      body: detail == null
          ? StateWidgets.loadingWidget
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person,
                              color: ConstColors.borderColor),
                          Text(detail!.customerId!.name ?? "",
                              style: ConstTextStyles.blackF14W4Op45),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          const Icon(Icons.phone,
                              color: ConstColors.borderColor),
                          Text(detail!.customerId!.phone ?? "",
                              style: ConstTextStyles.blackF14W4Op45),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Text("Guest: ${detail!.guestName}",
                          style: ConstTextStyles.blackF14W4Op45),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          const Icon(Icons.fingerprint,
                              color: ConstColors.borderColor),
                          const SizedBox(width: 4),
                          Text(detail!.fingerId ?? "",
                              style: ConstTextStyles.blackF14W4Op45),
                        ],
                      ),
                      const SizedBox(width: 40),
                      Row(
                        children: [
                          Text("Employee: ${detail!.employeeName}",
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Discount',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Price',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('FOC',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          for (int i = 0; i < services.length; i++)
                            DataRow(cells: [
                              DataCell(Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${services[i].name}"),
                                  Text("${services[i].nameCN}"),
                                ],
                              )),
                              DataCell(
                                  Text(showPrice(services[i].discount ?? 0))),
                              DataCell(Text(showPrice(services[i].price ?? 0))),
                              DataCell(Icon(services[i].isFoc!
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank)),
                            ]),
                          DataRow(cells: [
                            const DataCell(Text(
                              'Total',
                              style: ConstTextStyles.blackF16W5,
                            )),
                            DataCell(Container()),
                            DataCell(Text(
                              showPrice(detail!.totalAmount ?? 0),
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
