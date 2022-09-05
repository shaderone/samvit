// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReservationModal _$ReservationModalFromJson(Map<String, dynamic> json) {
  return _ReservationModal.fromJson(json);
}

/// @nodoc
mixin _$ReservationModal {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "no_of_seat")
  int get slotCount => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: "time")
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationModalCopyWith<ReservationModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationModalCopyWith<$Res> {
  factory $ReservationModalCopyWith(
          ReservationModal value, $Res Function(ReservationModal) then) =
      _$ReservationModalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "no_of_seat") int slotCount,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "time") String time});
}

/// @nodoc
class _$ReservationModalCopyWithImpl<$Res>
    implements $ReservationModalCopyWith<$Res> {
  _$ReservationModalCopyWithImpl(this._value, this._then);

  final ReservationModal _value;
  // ignore: unused_field
  final $Res Function(ReservationModal) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? slotCount = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slotCount: slotCount == freezed
          ? _value.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ReservationModalCopyWith<$Res>
    implements $ReservationModalCopyWith<$Res> {
  factory _$$_ReservationModalCopyWith(
          _$_ReservationModal value, $Res Function(_$_ReservationModal) then) =
      __$$_ReservationModalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "no_of_seat") int slotCount,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "time") String time});
}

/// @nodoc
class __$$_ReservationModalCopyWithImpl<$Res>
    extends _$ReservationModalCopyWithImpl<$Res>
    implements _$$_ReservationModalCopyWith<$Res> {
  __$$_ReservationModalCopyWithImpl(
      _$_ReservationModal _value, $Res Function(_$_ReservationModal) _then)
      : super(_value, (v) => _then(v as _$_ReservationModal));

  @override
  _$_ReservationModal get _value => super._value as _$_ReservationModal;

  @override
  $Res call({
    Object? id = freezed,
    Object? slotCount = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_ReservationModal(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slotCount: slotCount == freezed
          ? _value.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReservationModal implements _ReservationModal {
  const _$_ReservationModal(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "no_of_seat") required this.slotCount,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "address") required this.address,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "time") required this.time});

  factory _$_ReservationModal.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationModalFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "no_of_seat")
  final int slotCount;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "address")
  final String address;
  @override
  @JsonKey(name: "date")
  final String date;
  @override
  @JsonKey(name: "time")
  final String time;

  @override
  String toString() {
    return 'ReservationModal(id: $id, slotCount: $slotCount, name: $name, address: $address, date: $date, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationModal &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.slotCount, slotCount) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(slotCount),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_ReservationModalCopyWith<_$_ReservationModal> get copyWith =>
      __$$_ReservationModalCopyWithImpl<_$_ReservationModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationModalToJson(
      this,
    );
  }
}

abstract class _ReservationModal implements ReservationModal {
  const factory _ReservationModal(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "no_of_seat") required final int slotCount,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "address") required final String address,
      @JsonKey(name: "date") required final String date,
      @JsonKey(name: "time") required final String time}) = _$_ReservationModal;

  factory _ReservationModal.fromJson(Map<String, dynamic> json) =
      _$_ReservationModal.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "no_of_seat")
  int get slotCount;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "address")
  String get address;
  @override
  @JsonKey(name: "date")
  String get date;
  @override
  @JsonKey(name: "time")
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationModalCopyWith<_$_ReservationModal> get copyWith =>
      throw _privateConstructorUsedError;
}
