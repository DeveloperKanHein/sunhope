import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/customer.dart';

class CustomerEditForm extends StatelessWidget {
  final nameEditor = TextEditingController();
  final phoneEditor = TextEditingController();
  final balanceEditor = TextEditingController();
  final remark = TextEditingController();
  final Customer customer;
  final Function(Customer) onUpdate;
  CustomerEditForm(
      {super.key, required this.customer, required this.onUpdate}) {
    nameEditor.text = customer.name ?? "";
    phoneEditor.text = customer.phone ?? "";
    balanceEditor.text = customer.balance.toString();
    remark.text = customer.remark ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Edit Customer",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: nameEditor, label: "Name", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: phoneEditor,
                label: "Phone number",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            InputField(
              controller: balanceEditor,
              label: "Balance",
              onTyping: (_) {},
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            InputField(
              controller: remark,
              label: "Remark",
              onTyping: (_) {},
              inputType: TextInputType.number,
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
            onUpdate(Customer(
                id: customer.id,
                name: nameEditor.text,
                phone: phoneEditor.text,
                remark: remark.text,
                balance: int.parse(balanceEditor.text)));
          },
          child: const Text(
            "Update",
            style: ConstTextStyles.appColorF14W4,
          ),
        ),
      ],
    );
  }
}
