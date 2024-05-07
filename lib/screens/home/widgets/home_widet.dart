import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';

import '../../../constants/const_colors.dart';
import '../../../core/usb_setup/usb_setup.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int customer = 0;
  int service = 0;
  int checkout = 0;
  @override
  void initState() {
    super.initState();
    ApiRepoSingleton.instance.home().then((data) {
      setState(() {
        customer = data['customer'];
        service = data['service'];
        checkout = data['checkout'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUN HOPE"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                card(color: Colors.green, label: "Customers", value: customer),
                card(color: Colors.orange, label: "Services", value: service),
                card(
                    color: Colors.blue,
                    label: "Today Checkout",
                    value: checkout),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget card(
      {required Color color, required String label, required int value}) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: ConstTextStyles.whiteF20W5,
          ),
          Text(
            value.toString(),
            style: const TextStyle(
                fontSize: 36,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: ConstColors.white),
          ),
        ],
      ),
    );
  }
}
