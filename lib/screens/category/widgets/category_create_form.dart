import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/category.dart';

class CategoryCreateForm extends StatelessWidget {
  final Function(Category) onCreate;
  CategoryCreateForm({super.key, required this.onCreate});
  final name = TextEditingController();
  final nameCN = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Category",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              InputField(
                  controller: name, label: "Category name", onTyping: (_) {}),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: InputField(
                    controller: nameCN,
                    label: "Category name in chinese)",
                    onTyping: (_) {}),
              )
            ],
          ),
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
            if (name.text.isNotEmpty || nameCN.text.isNotEmpty) {
              onCreate(Category(name: name.text, nameCN: nameCN.text));
            }
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
