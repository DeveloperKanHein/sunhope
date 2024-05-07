import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/screens/customer/widgets/customer_create_form.dart';
import 'package:sunhope_computer_software/screens/customer/widgets/customer_edit_form.dart';
import 'package:sunhope_computer_software/screens/shop/widgets/shop_create_form.dart';
import 'package:sunhope_computer_software/screens/shop/widgets/shop_edit_form.dart';

import '../../widgets/input_field.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  final _search = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shops"),
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
                        label: Text('No.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('username',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Address',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Action',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    for (int i = 1; i < 5; i++)
                      DataRow(cells: [
                        DataCell(Text('$i')),
                        DataCell(Text('Shop - $i')),
                        DataCell(Text('shopusername$i')),
                        const DataCell(Text('Mandalay')),
                        DataCell(
                          InkWell(
                              onTap: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (_) => ShopEditForm(
                                        name: 'Shop $i',
                                        username: 'shopuser$i',
                                        address: 'Mandalay'));
                              },
                              child: const Text(
                                "Edit",
                                style: ConstTextStyles.blueF14W4,
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
              builder: (_) => ShopCreateForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
