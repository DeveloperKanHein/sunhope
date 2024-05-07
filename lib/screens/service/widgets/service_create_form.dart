import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/screens/category/widgets/category_dropdown_widget.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/service.dart';

class ServiceCreateForm extends StatelessWidget {
  final Function(Service) onCreate;
  ServiceCreateForm({super.key, required this.onCreate});

  final serviceName = TextEditingController();
  final serviceNameChinese = TextEditingController();
  final descriptionName = TextEditingController();
  final descriptionNameChinese = TextEditingController();
  final price = TextEditingController();
  final discount = TextEditingController();
  String? categoryId;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Service",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CategoryDropdownWidget(onChoose: (cat) {
                  if (cat != null) {
                    categoryId = cat.id;
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: InputField(
                    controller: serviceName,
                    label: "Service name",
                    onTyping: (_) {}),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: InputField(
                    controller: serviceNameChinese,
                    label: "Service name in chinese)",
                    onTyping: (_) {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InputField(
                  controller: price,
                  label: "Price",
                  onTyping: (_) {},
                  inputType: TextInputType.number,
                ),
              ),
              InputField(
                controller: discount,
                label: "Discount",
                onTyping: (_) {},
                inputType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InputField(
                  controller: descriptionName,
                  label: "Description",
                  onTyping: (_) {},
                  inputType: TextInputType.number,
                ),
              ),
              InputField(
                controller: descriptionNameChinese,
                label: "Description in chinese",
                onTyping: (_) {},
                inputType: TextInputType.number,
              ),
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
            if (categoryId != null) {
              onCreate(Service(
                categoryId: categoryId,
                name: serviceName.text,
                nameCN: serviceNameChinese.text,
                description: descriptionName.text,
                descriptionCN: descriptionNameChinese.text,
                price: int.parse(price.text),
                discount:
                    int.parse(discount.text.isEmpty ? "0" : discount.text),
              ));
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
