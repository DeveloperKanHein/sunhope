import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/customer.dart';

class CustomerCreateForm extends StatelessWidget {
  final Function(Customer) onCreate;
  CustomerCreateForm({super.key, required this.onCreate});
  final name = TextEditingController();
  final phone = TextEditingController();
  final balance = TextEditingController();
  final remark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Customer",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: name, label: "Name", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: phone,
                label: "Phone number",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            InputField(
              controller: balance,
              label: "Balance",
              onTyping: (_) {},
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: remark,
                label: "Remark",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 15.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: ElevatedButton(
            //               onPressed: () {}, child: const Text("Create"))),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            "Close",
            style: ConstTextStyles.blackF14W4Op45,
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            onCreate(Customer(
              name: name.text,
              phone: phone.text,
              balance: int.parse(balance.text),
              remark: remark.text,
            ));
          },
          child: const Text(
            "Create",
            style: ConstTextStyles.appColorF14W4,
          ),
        ),
      ],
    );
  }
}
