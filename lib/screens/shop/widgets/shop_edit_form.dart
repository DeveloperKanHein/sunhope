import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';

class ShopEditForm extends StatelessWidget {
  final String name;
  final String username;
  final String address;
  final nameEditor = TextEditingController();
  final usernameEditor = TextEditingController();
  final passwordEditor = TextEditingController();
  final confirmEditor = TextEditingController();
  final addressEditor = TextEditingController();
  ShopEditForm(
      {super.key,
      required this.name,
      required this.username,
      required this.address}) {
    nameEditor.text = name;
    usernameEditor.text = username;
    addressEditor.text = address;
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
            StateWidgets.showLoading(context);
            Future.delayed(const Duration(seconds: 3)).then((value) {
              StateWidgets.hideLoading(context);

              StateWidgets.showAlertMessage(
                  title: "Successful",
                  message: "$name is updated successfully.",
                  context: context,
                  onPressedOK: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            });
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
