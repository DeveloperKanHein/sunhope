// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchased.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Purchased _$PurchasedFromJson(Map<String, dynamic> json) => Purchased(
      employeeId: json['employeeId'] as String?,
      employeeName: json['employeeName'] as String?,
      customerId: json['customerId'] == null
          ? null
          : Customer.fromJson(json['customerId'] as Map<String, dynamic>),
      customerName: json['customerName'] as String?,
      customerFingerId: json['customerFingerId'] as String?,
      totalAmount: json['totalAmount'] as int?,
      balance: json['balance'] as int?,
      guestName: json['guestName'] as String?,
      fingerId: json['fingerId'] as String?,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: json['createdAt'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$PurchasedToJson(Purchased instance) => <String, dynamic>{
      '_id': instance.id,
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerFingerId': instance.customerFingerId,
      'guestName': instance.guestName,
      'fingerId': instance.fingerId,
      'totalAmount': instance.totalAmount,
      'balance': instance.balance,
      'services': instance.services,
      'createdAt': instance.createdAt,
    };
