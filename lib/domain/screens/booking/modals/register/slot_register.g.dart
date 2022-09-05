// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SlotRegisterModal _$$_SlotRegisterModalFromJson(Map<String, dynamic> json) =>
    _$_SlotRegisterModal(
      registrationToken: json['id'] as String,
      isRegistered: json['is_registered'] as bool,
      registrationError: json['error'] as String,
    );

Map<String, dynamic> _$$_SlotRegisterModalToJson(
        _$_SlotRegisterModal instance) =>
    <String, dynamic>{
      'id': instance.registrationToken,
      'is_registered': instance.isRegistered,
      'error': instance.registrationError,
    };
