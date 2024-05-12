import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/employee.dart';

class EmployeeCreateForm extends StatelessWidget {
  final Function(Employee) onCreate;
  EmployeeCreateForm({super.key, required this.onCreate});
  final name = TextEditingController();
  final phone = TextEditingController();
  final employeeId = TextEditingController();
  final nickname = TextEditingController();
  final role = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Employee",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: name, label: "Name", onTyping: (_) {}),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: InputField(
            //     controller: phone,
            //     label: "Phone number",
            //     onTyping: (_) {},
            //     inputType: TextInputType.phone,
            //   ),
            // ),
            // InputField(controller: role, label: "Role", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                  controller: employeeId,
                  label: "Employee ID",
                  onTyping: (_) {}),
            ),
            InputField(
                controller: nickname, label: "Nickname", onTyping: (_) {}),
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
            onCreate(Employee(
                name: name.text,
                // phone: phone.text,
                // role: role.text,
                nickname: nickname.text,
                employeeID: employeeId.text));
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
