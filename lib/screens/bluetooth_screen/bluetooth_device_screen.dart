// import 'package:flutter/material.dart';
// import 'package:sunhope_computer_software/constants/const_text_style.dart';
//
// import '../../core/bluetooth_setup/bluetooth_setup.dart';
//
// class BluetoothDeviceScreen extends StatefulWidget {
//   const BluetoothDeviceScreen({super.key});
//
//   @override
//   State<BluetoothDeviceScreen> createState() => _BluetoothDeviceScreenState();
// }
//
// class _BluetoothDeviceScreenState extends State<BluetoothDeviceScreen> {
//   List<String> devices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     BluetoothSetup.init();
//     BluetoothSetup.stream.listen((result) {
//       // if (BluetoothSetup.deviceId != "") {
//       //   BluetoothSetup.send("HELLO");
//       // }
//       print(result.name);
//       if (!devices.contains(result.deviceId)) {
//         setState(() {
//           devices.add(result.deviceId);
//         });
//       }
//       // print(devices);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bluetooth Setting"),
//       ),
//       body: ListView(
//         children: [
//           for (int i = 0; i < devices.length; i++)
//             ListTile(
//               onTap: () async {
//                 await BluetoothSetup.connect(devices[i]);
//               },
//               title: Text(
//                 devices[i],
//                 style: ConstTextStyles.blackF14W4Op85,
//               ),
//               trailing: devices[i] != BluetoothSetup.deviceId
//                   ? const SizedBox(
//                       width: 1,
//                       height: 1,
//                     )
//                   : const Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 12,
//                     ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           BluetoothSetup.send("HELLO");
//         },
//         child: const Icon(Icons.send),
//       ),
//     );
//   }
// }
