import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/core/serial_port/serial_port_handler.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';
import 'package:uuid/uuid.dart';

import '../../constants/const_text_style.dart';

class FingerScanWidget extends StatefulWidget {
  final Function(String, String?) onSuccess;
  const FingerScanWidget({super.key, required this.onSuccess});

  @override
  State<FingerScanWidget> createState() => _FingerScanWidgetState();
}

class _FingerScanWidgetState extends State<FingerScanWidget> {
  double scanTime = 1.0;
  final name = TextEditingController();
  int fingerId = 1;
  String? fingerData;
  @override
  void initState() {
    super.initState();
    var timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (scanTime < 10) {
        setState(() {
          scanTime++;
        });
      } else {
        timer.cancel();
      }
    });
    if (SerialPortHandler.portReader != null) {
      SerialPortHandler.portReader!.stream.listen((data) {
        if (data.isNotEmpty) {
          if (mounted) {
            setState(() {
              fingerId = data[0]; //int.parse(utf8.decode(data));
              fingerData = const Uuid().v4();
            });
          }
          if (fingerId != 1) {
            Future.delayed(const Duration(milliseconds: 200)).then((_) {
              widget.onSuccess(name.text, fingerData);
              // SerialPortHandler.portReader!.close();
              timer.cancel();
            });
          }
        }
      });
    }
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
            fingerId == 1
                ? SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                        value: scanTime / 10,
                        color: Colors.green,
                        strokeWidth: 10),
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                fingerId != 1 ? "SUCCESS" : "Scanning.....",
                style: TextStyle(
                  color: scanTime == 10 ? Colors.green : Colors.grey,
                  fontWeight:
                      scanTime == 10 ? FontWeight.bold : FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            InputField(controller: name, label: "Guest Name", onTyping: (_) {}),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            widget.onSuccess(name.text, fingerData);
            SerialPortHandler.portReader!.close();
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
