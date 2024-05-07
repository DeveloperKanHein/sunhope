// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchase _$PurchaseFromJson(Map<String, dynamic> json) => Purchase(
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String?,
      totalAmount: json['totalAmount'] as int?,
      guestName: json['guestName'] as String?,
      guestId: json['guestId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'guestName': instance.guestName,
      'guestId': instance.guestId,
      'totalAmount': instance.totalAmount,
      'services': instance.services,
    };
