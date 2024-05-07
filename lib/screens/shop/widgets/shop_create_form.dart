import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

class ShopCreateForm extends StatelessWidget {
  ShopCreateForm({super.key});
  final name = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  final address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Create New Shop",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(controller: name, label: "Shop Name", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: username,
                label: "Username",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            InputField(
              controller: password,
              label: "Password",
              onTyping: (_) {},
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InputField(
                controller: confirm,
                label: "Confirm Password",
                onTyping: (_) {},
                inputType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InputField(
                controller: address,
                label: "Address",
                onTyping: (_) {},
                inputType: TextInputType.number,
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
            StateWidgets.showLoading(context);
            Future.delayed(const Duration(seconds: 3)).then((value) {
              StateWidgets.hideLoading(context);

              StateWidgets.showAlertMessage(
                  title: "Successful",
                  message: "New shop is created successfully.",
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
