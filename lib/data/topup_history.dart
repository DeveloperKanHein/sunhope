import 'package:json_annotation/json_annotation.dart';
import 'shop.dart';
import 'customer.dart';

part 'topup_history.g.dart';

@JsonSerializable()
class TopupHistory {
  @JsonKey(name: "_id")
  String? id;
  Shop? shop;
  Customer? customer;
  int? cash;
  int? kpay;
  String? createdAt;
  TopupHistory(
      {this.id,
      this.shop,
      this.customer,
      this.cash,
      this.kpay,
      this.createdAt});
  factory TopupHistory.fromJson(Map<String, dynamic> json) =>
      _$TopupHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$TopupHistoryToJson(this);
}
