import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';

class PortSetupScreen extends StatefulWidget {
  const PortSetupScreen({super.key});

  @override
  State<PortSetupScreen> createState() => _PortSetupScreenState();
}

extension IntToString on int {
  String toHex() => '0x${toRadixString(16)}';
  String toPadded([int width = 3]) => toString().padLeft(width, '0');
  String toTransport() {
    switch (this) {
      case SerialPortTransport.usb:
        return 'USB';
      case SerialPortTransport.bluetooth:
        return 'Bluetooth';
      case SerialPortTransport.native:
        return 'Native';
      default:
        return 'Unknown';
    }
  }
}

class _PortSetupScreenState extends State<PortSetupScreen> {
  var availablePorts = [];

  //Connection Serial Port
  SerialPort? serialPort;
  SerialPortReader? reader;

  void initPorts() {
    setState(() => availablePorts = SerialPort.availablePorts);
  }

  void listen() {
    if (reader != null) {
      reader!.stream.listen((data) {
        debugLog(data);
        debugLog("HELLO");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initPorts();
    if (reader != null) {
      reader!.stream.listen((data) {
        debugLog(data);
        debugLog("HELLO");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Serial Port example'),
        ),
        body: Scrollbar(
          child: ListView(
            children: [
              for (final address in availablePorts)
                Builder(builder: (context) {
                  final port = SerialPort(address);
                  return ExpansionTile(
                    title: Text(address),
                    children: [
                      cardListTile(
                          port: port,
                          name: 'Description',
                          value: port.description),
                      // CardListTile(
                      //     port, 'Transport', port.transport.toTransport()),
                      // CardListTile(port, 'USB Bus', port.busNumber?.toPadded()),
                      // CardListTile(
                      //     port, 'USB Device', port.deviceNumber?.toPadded()),
                      // CardListTile(port, 'Vendor ID', port.vendorId?.toHex()),
                      // CardListTile(port, 'Product ID', port.productId?.toHex()),
                      // CardListTile(port, 'Manufacturer', port.manufacturer),
                      // CardListTile(port, 'Product Name', port.productName),
                      // CardListTile(port, 'Serial Number', port.serialNumber),
                      // CardListTile(port, 'MAC Address', port.macAddress),
                    ],
                  );
                }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: initPorts,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }

  Widget cardListTile(
      {required SerialPort port, required String name, String? value}) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
        trailing: InkWell(
            onTap: () {
              if (port.name != null) {
                debugLog(port.name);
                setState(() {
                  serialPort = SerialPort(port.name ?? "");
                  serialPort!.openReadWrite();
                  serialPort!.write(stringToBytes("HI"));
                  reader = SerialPortReader(serialPort!);
                });
                // listen();
              }
            },
            child: serialPort == null
                ? const Text("Connect")
                : Text(serialPort!.name != port.name ? "Connect" : "Unpair")),
      ),
    );
  }
}

class CardListTile extends StatelessWidget {
  final SerialPort port;
  final String name;
  final String? value;

  const CardListTile(this.port, this.name, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
        trailing: InkWell(child: Text("Connect")),
      ),
    );
  }
}

Uint8List stringToBytes(String data) {
  List<int> list = utf8.encode(data);
  Uint8List bytes = Uint8List.fromList(list);
  return bytes;
}
