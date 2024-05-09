import 'package:flutter_libserialport/flutter_libserialport.dart';

class SerialPortHandler {
  static SerialPortReader? portReader;

  void listen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (portReader != null) {
      portReader!.stream.listen((data) {
        //
      });
    }
  }
}
