import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/const_text_style.dart';

class FingerScanWidget extends StatefulWidget {
  const FingerScanWidget({super.key});

  @override
  State<FingerScanWidget> createState() => _FingerScanWidgetState();
}

class _FingerScanWidgetState extends State<FingerScanWidget> {
  double scanTime = 1.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (scanTime < 10) {
        setState(() {
          scanTime++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(""),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                  value: scanTime / 10, color: Colors.green, strokeWidth: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                scanTime == 10 ? "SUCCESS" : "Scanning.....",
                style: TextStyle(
                  color: scanTime == 10 ? Colors.green : Colors.grey,
                  fontWeight:
                      scanTime == 10 ? FontWeight.bold : FontWeight.w400,
                  fontSize: 20,
                ),
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
