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
      customerFingerId: json['customerFingerId'] as String?,
      totalAmount: json['totalAmount'] as int?,
      guestName: json['guestName'] as String?,
      fingerId: json['fingerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      cash: json['cash'] as int? ?? 0,
      kpay: json['kpay'] as int? ?? 0,
      createdAt: json['createdAt'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$PurchaseToJson(Purchase instance) => <String, dynamic>{
      '_id': instance.id,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerFingerId': instance.customerFingerId,
      'guestName': instance.guestName,
      'fingerId': instance.fingerId,
      'totalAmount': instance.totalAmount,
      'services': instance.services,
      'cash': instance.cash,
      'kpay': instance.kpay,
      'createdAt': instance.createdAt,
    };
