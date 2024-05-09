// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plugin/flutter_blue_plugin.dart';
//
// import '../../core/log/debug_log.dart';
//
// class BluetoothConnectionScreen extends StatefulWidget {
//   const BluetoothConnectionScreen({super.key});
//
//   @override
//   State<BluetoothConnectionScreen> createState() =>
//       _BluetoothConnectionScreenState();
// }
//
// class _BluetoothConnectionScreenState extends State<BluetoothConnectionScreen> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Listen to scan results
//     flutterBlue.scanResults.listen((results) {
//       debugLog(results);
//       // do something with scan results
//       for (ScanResult r in results) {
//         print('${r.device.name} found! rssi: ${r.rssi}');
//       }
//     });
//     flutterBlue.startScan(timeout: const Duration(seconds: 30));
//     // Stop scanning
//     // flutterBlue.stopScan();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bluetooth Connection"),
//       ),
//       body: ListView(
//         children: [
//           //
//         ],
//       ),
//     );
//   }
// }
