import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/shop.dart';

class ShopCreateForm extends StatelessWidget {
  final Function(Shop) onCreate;
  ShopCreateForm({super.key, required this.onCreate});
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
            Shop shop = Shop();

            if (password.text.isNotEmpty) {
              if (password.text == confirm.text) {
                shop.name = name.text;
                shop.username = username.text;
                shop.address = address.text;
                shop.password = password.text;
                Navigator.pop(context);
                onCreate(shop);
              } else {
                StateWidgets.showAlertMessage(
                    context: context,
                    title: "Password doesn't Match!",
                    message: "Please type the same word in password fields.",
                    onPressedOK: () {
                      Navigator.pop(context);
                    });
              }
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
