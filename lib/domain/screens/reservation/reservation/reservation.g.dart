// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReservationModal _$$_ReservationModalFromJson(Map<String, dynamic> json) =>
    _$_ReservationModal(
      id: json['id'] as int,
      slotCount: json['no_of_seat'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_ReservationModalToJson(_$_ReservationModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no_of_seat': instance.slotCount,
      'name': instance.name,
      'address': instance.address,
      'date': instance.date,
      'time': instance.time,
    };
