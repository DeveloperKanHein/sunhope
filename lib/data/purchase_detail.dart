import 'package:json_annotation/json_annotation.dart';
import 'purchased_service.dart';
import 'customer.dart';
import 'service.dart';

part 'purchase_detail.g.dart';

@JsonSerializable()
class PurchaseDetail {
  String? employeeId;
  String? employeeName;
  Customer? customerId;
  String? customerName;
  String? customerFingerId;
  String? guestName;
  String? fingerId;
  int? totalAmount;
  String? createdAt;
  List<PurchasedService>? services;
  PurchaseDetail({
    this.employeeId,
    this.employeeName,
    this.customerId,
    this.customerName,
    this.customerFingerId,
    this.totalAmount,
    this.guestName,
    this.fingerId,
    this.services,
    this.createdAt,
  });
  factory PurchaseDetail.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseDetailToJson(this);
}
