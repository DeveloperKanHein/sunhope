// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupHistory _$TopupHistoryFromJson(Map<String, dynamic> json) => TopupHistory(
      id: json['_id'] as String?,
      shop: json['shop'] == null
          ? null
          : Shop.fromJson(json['shop'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      cash: json['cash'] as int?,
      kpay: json['kpay'] as int?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$TopupHistoryToJson(TopupHistory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shop': instance.shop,
      'customer': instance.customer,
      'cash': instance.cash,
      'kpay': instance.kpay,
      'createdAt': instance.createdAt,
    };
