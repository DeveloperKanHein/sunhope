import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

class DiscountCreateForm extends StatefulWidget {
  const DiscountCreateForm({super.key});

  @override
  State<DiscountCreateForm> createState() => _DiscountCreateFormState();
}

class _DiscountCreateFormState extends State<DiscountCreateForm> {
  final topUP = TextEditingController();
  final promotion = TextEditingController();
  final date = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        date.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Promotion",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: topUP, label: "Top-Up", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: promotion,
                label: "Promotion",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            InputField(
              controller: date,
              label: "Date",
              onTyping: (_) {},
              inputType: TextInputType.number,
              suffixWidget: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: const Icon(Icons.calendar_month)),
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
            StateWidgets.showLoading(context);
            Future.delayed(const Duration(seconds: 3)).then((value) {
              StateWidgets.hideLoading(context);

              StateWidgets.showAlertMessage(
                  title: "Successful",
                  message: "New promotion is created successfully.",
                  context: context,
                  onPressedOK: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            });
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
