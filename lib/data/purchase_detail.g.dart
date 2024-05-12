// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseDetail _$PurchaseDetailFromJson(Map<String, dynamic> json) =>
    PurchaseDetail(
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      customerId: json['customerId'] == null
          ? null
          : Customer.fromJson(json['customerId'] as Map<String, dynamic>),
      customerName: json['customerName'] as String?,
      totalAmount: json['totalAmount'] as int?,
      guestName: json['guestName'] as String?,
      fingerId: json['fingerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => PurchasedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$PurchaseDetailToJson(PurchaseDetail instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'guestName': instance.guestName,
      'fingerId': instance.fingerId,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt,
      'services': instance.services,
    };
