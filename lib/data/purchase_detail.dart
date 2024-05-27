import 'package:json_annotation/json_annotation.dart';
import 'package:sunhope_computer_software/data/shop.dart';
import 'purchased_service.dart';
import 'customer.dart';
import 'service.dart';

part 'purchase_detail.g.dart';

@JsonSerializable()
class PurchaseDetail {
  Shop? shop;
  String? employeeId;
  String? employeeName;
  Customer? customerId;
  String? customerName;
  String? customerFingerId;
  String? guestName;
  String? fingerId;
  int? totalAmount;
  int? cash;
  int? kpay;
  int? count;
  String? createdAt;
  List<PurchasedService>? services;
  PurchaseDetail({
    this.shop,
    this.employeeId,
    this.employeeName,
    this.customerId,
    this.customerName,
    this.customerFingerId,
    this.totalAmount,
    this.cash,
    this.kpay,
    this.guestName,
    this.fingerId,
    this.services,
    this.createdAt,
  });
  factory PurchaseDetail.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDetailFromJson(json);
  Map<String, dynamic> toJson() => _$PurchaseDetailToJson(this);
}
