import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

import '../../../data/shop.dart';

class ShopEditForm extends StatelessWidget {
  final Shop shop;
  final Function(Shop) onUpdate;
  final nameEditor = TextEditingController();
  final usernameEditor = TextEditingController();
  final passwordEditor = TextEditingController();
  final confirmEditor = TextEditingController();
  final addressEditor = TextEditingController();
  ShopEditForm({super.key, required this.shop, required this.onUpdate}) {
    nameEditor.text = shop.name ?? "";
    usernameEditor.text = shop.username ?? "";
    addressEditor.text = shop.address ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "Edit Shop",
          style: ConstTextStyles.blackF18W4,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
                controller: nameEditor, label: "Shop Name", onTyping: (_) {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InputField(
                controller: usernameEditor,
                label: "Username",
                onTyping: (_) {},
                inputType: TextInputType.phone,
              ),
            ),
            InputField(
              controller: passwordEditor,
              label: "Password",
              onTyping: (_) {},
              inputType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InputField(
                controller: confirmEditor,
                label: "Confirm Password",
                onTyping: (_) {},
                inputType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: InputField(
                controller: addressEditor,
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
            shop.name = nameEditor.text;
            shop.username = usernameEditor.text;
            shop.address = addressEditor.text;
            if (passwordEditor.text.isNotEmpty) {
              if (passwordEditor.text == confirmEditor.text) {
                shop.password = passwordEditor.text;
              } else {
                StateWidgets.showAlertMessage(
                    context: context,
                    title: "Password doesn't Match!",
                    message: "Please type the same word in password fields.",
                    onPressedOK: () {
                      Navigator.pop(context);
                    });
              }
            } else {
              shop.password = null;
            }
            Navigator.pop(context);
            onUpdate(shop);
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
