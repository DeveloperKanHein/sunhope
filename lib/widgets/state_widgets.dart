import 'package:flutter/material.dart';

class StateWidgets {
  static Widget loadingWidget = const Center(
    child: CircularProgressIndicator(),
  );
  static Widget emptyWidget = const Center(child: Text("Empty Data!"));
  static Widget networkErrorWidget =
      const Center(child: Text("Network Error :("));
  static void showLoading(BuildContext context) {
    Widget dia = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: loadingWidget,
            ),
          ],
        ),
      ),
    );

    showDialog(
        barrierDismissible: false, context: context, builder: (_) => dia);
  }

  static void showAlertMessage(
      {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onPressedOK}) {
    Widget dia = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: onPressedOK ??
                () {
                  Navigator.pop(context);
                },
            child: const Text("OK")),
      ],
    );

    showDialog(
        barrierDismissible: false, context: context, builder: (_) => dia);
  }

  static void showAlertDialog(
      {required BuildContext context,
      required String title,
      required String message,
      required VoidCallback onPressedOK}) {
    Widget dia = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            )),
        const SizedBox(width: 10),
        TextButton(onPressed: onPressedOK, child: const Text("OK")),
      ],
    );

    showDialog(
        barrierDismissible: false, context: context, builder: (_) => dia);
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
