import 'package:flutter/material.dart';
import 'package:sunhope_computer_software/constants/languages.dart';
import 'package:sunhope_computer_software/core/storage/app_storage.dart';
import 'package:sunhope_computer_software/screens/home/home_screen.dart';
import 'package:sunhope_computer_software/screens/login/login_screen.dart';
import 'config/app_config.dart';
import 'package:get/get.dart';

import 'constants/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: AppStorage.getToken == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
