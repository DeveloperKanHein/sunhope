import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../../data/category.dart';

class CategoryEditForm extends StatelessWidget {
  final name = TextEditingController();
  final nameCN = TextEditingController();
  final Function(Category) onUpdate;
  final Category category;
  CategoryEditForm(
      {super.key, required this.category, required this.onUpdate}) {
    name.text = category.name ?? "";
    nameCN.text = category.nameCN ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Edit Category",
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
            debugLog("SUCCESS");
            onUpdate(Category(
                id: category.id, name: name.text, nameCN: nameCN.text));
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
