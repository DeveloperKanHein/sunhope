import 'package:flutter/foundation.dart';

void debugLog(dynamic d) {
  if (kDebugMode) {
    print("\nSTART DEBUG ==================>>>>>>>>>>>>>>>>>>\n");
    print(d);
    print("\n<<<<<<<<<<<<<<<<<<================== END DEBUG\n");
  }
}
