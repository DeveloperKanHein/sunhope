import 'package:sunhope_computer_software/data/purchase.dart';

import '../../data/daily.dart';
import '../../data/monthly.dart';
import '../../data/purchased.dart';

int getMonthlyTotalAmount(List<Monthly> reports) {
  int total = 0;
  for (var report in reports) {
    total += report.totalAmount ?? 0;
  }
  return total;
}

int getDailyTotalAmount(List<Daily> reports) {
  int total = 0;
  for (var report in reports) {
    total += report.totalAmount ?? 0;
  }
  return total;
}

int getPurchaseTotalAmount(List<Purchased> reports) {
  int total = 0;
  for (var report in reports) {
    total += report.totalAmount ?? 0;
  }
  return total;
}
