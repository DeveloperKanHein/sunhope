import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:quick_blue/quick_blue.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';

class BluetoothSetup {
  static String deviceId = "";
  static String characteristicId = "";
  static String serviceId = "";

  static Stream<BlueScanResult> get stream => QuickBlue.scanResultStream;

  static Future<void> init() async {
    if (await QuickBlue.isBluetoothAvailable()) {
      QuickBlue.startScan();
    }
  }

  // Data would receive from value handler
  static void _handleValueChange(
      String deviceId, String characterId, Uint8List value) {
    characteristicId = characterId;
    debugLog(hex.encode(value));
  }

  static void _handleServiceDiscovery(String deviceId, String serveId) {
    serviceId = serveId;
  }

  static Future<void> connect(String id) async {
    deviceId = id;
    QuickBlue.connect(deviceId);
    QuickBlue.setValueHandler(_handleValueChange);
    QuickBlue.setServiceHandler(_handleServiceDiscovery);
    // await QuickBlue.setNotifiable(
    //     deviceId, serviceId, characteristicId, BleInputProperty.notification);
  }

  static void send(String data) {
    List<int> list = utf8.encode(data);
    Uint8List bytes = Uint8List.fromList(list);
    QuickBlue.writeValue(deviceId, serviceId, characteristicId, bytes,
        BleOutputProperty.withResponse);
  }
}
