import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/data/service.dart';

class ServiceDetail extends StatelessWidget {
  final Service service;
  const ServiceDetail({super.key, required this.service});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Service Name: ${service.name}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Service Name(Chinese): ${service.nameCN}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Price: ${service.price}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Discount: ${service.discount}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Description: ${service.description}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Description(Chinese): ${service.descriptionCN}",
                style: ConstTextStyles.blackF14W4Op85,
              ),
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
      ],
    );
  }
}
