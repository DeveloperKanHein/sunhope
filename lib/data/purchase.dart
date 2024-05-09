import 'package:json_annotation/json_annotation.dart';
import 'service_req.dart';

part 'purchase.g.dart';

@JsonSerializable()
class Purchase {
  @JsonKey(name: "_id")
  String? id;
  String? employeeId;
  String? employeeName;
  String? customerId;
  String? customerName;
  String? guestName;
  String? fingerId;
  int? totalAmount;
  List<Map<String, dynamic>>? services;
  Purchase(
      {this.employeeId,
      this.employeeName,
      this.customerId,
      this.customerName,
      this.totalAmount,
      this.guestName,
      this.fingerId,
      this.services});
  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseToJson(this);
}
