import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/screens/discount/widgets/discount_create_form.dart';
import 'package:sunhope_computer_software/screens/shop/widgets/shop_create_form.dart';
import '../../widgets/state_widgets.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotion"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const [
                    DataColumn(
                        label: Text('Top-Up',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Promotion',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Active',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Action',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    for (int i = 1; i < 10; i++)
                      DataRow(cells: [
                        const DataCell(Text('200000')),
                        const DataCell(Text('50000')),
                        const DataCell(Text('25/03/2024')),
                        DataCell(Icon(i == 1 ? Icons.check : Icons.close)),
                        DataCell(
                          InkWell(
                              onTap: () {
                                StateWidgets.showAlertMessage(
                                  title: "Successful",
                                  message:
                                      "This promotion is disabled successfully.",
                                  context: context,
                                  onPressedOK: () {},
                                );
                              },
                              child: const Text(
                                "Stop Promotion",
                                style: TextStyle(color: Colors.red),
                              )),
                        ),
                      ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => const DiscountCreateForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
