import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/employee.dart';

class EmployeeEditForm extends StatelessWidget {
  final nameEditor = TextEditingController();
  final phoneEditor = TextEditingController();
  final employeeId = TextEditingController();
  final nickname = TextEditingController();
  final role = TextEditingController();

  final Employee employee;
  final Function(Employee) onUpdate;
  EmployeeEditForm(
      {super.key, required this.employee, required this.onUpdate}) {
    nameEditor.text = employee.name ?? "";
    // phoneEditor.text = employee.phone ?? "";
    employeeId.text = employee.employeeID ?? "";
    nickname.text = employee.nickname ?? "";
    // role.text = employee.role ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Edit Employee",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: nameEditor, label: "Name", onTyping: (_) {}),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: InputField(
            //     controller: phoneEditor,
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
            onUpdate(Employee(
                id: employee.id,
                name: nameEditor.text,
                // phone: phoneEditor.text,
                // role: role.text,
                nickname: nickname.text,
                employeeID: employeeId.text));
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
