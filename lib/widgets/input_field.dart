import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onTyping;
  final Function(String)? onSubmitted;
  final TextInputType inputType;
  Widget? prefixWidget;
  Widget? suffixWidget;
  InputField(
      {super.key,
      required this.controller,
      required this.label,
      required this.onTyping,
      this.onSubmitted,
      this.inputType = TextInputType.text,
      this.prefixWidget,
      this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextField(
      keyboardType: inputType,
      controller: controller,
      onChanged: onTyping,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: textTheme.bodyMedium!.copyWith(color: Colors.grey),
        hintText: label,
        suffixIcon: suffixWidget,
        prefixIcon: prefixWidget,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: ConstColors.borderColor, width: 1)),
      ),
    );
  }
}
