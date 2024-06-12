import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/data/customer_create_req.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/customer.dart';

class CustomerCreateForm extends StatelessWidget {
  final Function(CustomerCreateReq) onCreate;
  CustomerCreateForm({super.key, required this.onCreate});
  final name = TextEditingController();
  final phone = TextEditingController();
  final balance = TextEditingController();
  final cash = TextEditingController();
  final kpay = TextEditingController();
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
            // InputField(
            //   controller: balance,
            //   label: "Balance",
            //   onTyping: (_) {},
            //   inputType: TextInputType.number,
            // ),
            InputField(
              controller: cash,
              label: "Cash",
              onTyping: (_) {},
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InputField(
                controller: kpay,
                label: "K-Pay",
                onTyping: (_) {},
                inputType: TextInputType.number,
              ),
            ),
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
            final req = CustomerCreateReq();
            req.name = name.text;
            req.phone = phone.text;
            req.cash = int.parse(cash.text.isEmpty ? "0" : cash.text);
            req.kpay = int.parse(kpay.text.isEmpty ? "0" : kpay.text);
            onCreate(req);
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
