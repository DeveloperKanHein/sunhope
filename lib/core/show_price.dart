import 'package:intl/intl.dart';

String showPrice(int amount) {
  var formatter = NumberFormat('#,##');
  String result = formatter.format(amount);
  return result;
}
