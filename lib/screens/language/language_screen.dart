import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool isEN = Get.locale == const Locale('en', 'US');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isEN = !isEN;
            });
            var locale = const Locale('en', 'US');
            Get.updateLocale(locale);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isEN
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  : const Icon(Icons.check_box_outline_blank),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("English"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {
            setState(() {
              isEN = !isEN;
            });
            var locale = const Locale('cn', 'CHN');
            Get.updateLocale(locale);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !isEN
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  : const Icon(Icons.check_box_outline_blank),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("Chinese"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
