// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentHistoryModal _$$_PaymentHistoryModalFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentHistoryModal(
      id: json['id'] as int,
      amount: json['amount'] as int,
      collegeName: json['college_name'] as String,
      paymentType: json['payment_type'] as String,
      paymentStatus: json['payment_status'] as String,
    );

Map<String, dynamic> _$$_PaymentHistoryModalToJson(
        _$_PaymentHistoryModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'college_name': instance.collegeName,
      'payment_type': instance.paymentType,
      'payment_status': instance.paymentStatus,
    };
