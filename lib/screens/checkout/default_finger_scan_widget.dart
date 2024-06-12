import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/core/serial_port/serial_port_handler.dart';
import 'package:uuid/uuid.dart';

import '../../constants/const_text_style.dart';

class DefaultFingerScanWidget extends StatefulWidget {
  final Function(bool, String?) onSuccess;
  const DefaultFingerScanWidget({super.key, required this.onSuccess});

  @override
  State<DefaultFingerScanWidget> createState() =>
      _DefaultFingerScanWidgetState();
}

class _DefaultFingerScanWidgetState extends State<DefaultFingerScanWidget> {
  double scanTime = 1.0;
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
    SerialPortHandler.portReader!.stream.listen((data) {
      debugLog(data);
      if (data.isNotEmpty) {
        if (mounted) {
          setState(() {
            fingerId = data[0];
            fingerData = const Uuid().v4();
          });
        }
        if (fingerId != 1) {
          Future.delayed(const Duration(milliseconds: 200)).then((_) {
            widget.onSuccess(true, fingerData);
            // SerialPortHandler.portReader!.close();
            timer.cancel();
          });
        }
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
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            widget.onSuccess(true, fingerData);
            if (SerialPortHandler.portReader != null) {
              SerialPortHandler.portReader!.close();
            }
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
