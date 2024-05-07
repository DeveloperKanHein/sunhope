import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/languages.dart';
import 'package:sunhope_computer_software/screens/home/home_screen.dart';
import 'config/app_config.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return PortSetupScreen();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      translations: Languages(), // Your translations
      locale: const Locale('en', 'US'),
      home: const HomeScreen(),
      // home: const BluetoothDeviceScreen(),
    );
  }
}
