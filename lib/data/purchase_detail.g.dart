// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseDetail _$PurchaseDetailFromJson(Map<String, dynamic> json) =>
    PurchaseDetail(
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      customerId: json['customerId'] == null
          ? null
          : Customer.fromJson(json['customerId'] as Map<String, dynamic>),
      customerName: json['customerName'] as String?,
      customerFingerId: json['customerFingerId'] as String?,
      totalAmount: json['totalAmount'] as int?,
      cash: json['cash'] as int?,
      kpay: json['kpay'] as int?,
      guestName: json['guestName'] as String?,
      fingerId: json['fingerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => PurchasedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
    )..count = json['count'] as int?;

Map<String, dynamic> _$PurchaseDetailToJson(PurchaseDetail instance) =>
    <String, dynamic>{
      'shop': instance.shop,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerFingerId': instance.customerFingerId,
      'guestName': instance.guestName,
      'fingerId': instance.fingerId,
      'totalAmount': instance.totalAmount,
      'cash': instance.cash,
      'kpay': instance.kpay,
      'count': instance.count,
      'createdAt': instance.createdAt,
      'services': instance.services,
    };
