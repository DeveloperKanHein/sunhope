import 'package:json_annotation/json_annotation.dart';
import 'customer.dart';
import 'service_req.dart';

part 'purchased.g.dart';

@JsonSerializable()
class Purchased {
  @JsonKey(name: "_id")
  String? id;
  String? employeeId;
  String? employeeName;
  Customer? customerId;
  String? customerName;
  String? customerFingerId;
  String? guestName;
  String? fingerId;
  int? totalAmount;
  int? balance;
  List<Map<String, dynamic>>? services;
  String? createdAt;
  Purchased(
      {this.employeeId,
      this.employeeName,
      this.customerId,
      this.customerName,
      this.customerFingerId,
      this.totalAmount,
      this.balance,
      this.guestName,
      this.fingerId,
      this.services,
      this.createdAt});
  factory Purchased.fromJson(Map<String, dynamic> json) =>
      _$PurchasedFromJson(json);
  Map<String, dynamic> toJson() => _$PurchasedToJson(this);
}
