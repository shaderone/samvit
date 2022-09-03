// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeSlotModal _$TimeSlotModalFromJson(Map<String, dynamic> json) {
  return _TimeSlotModal.fromJson(json);
}

/// @nodoc
mixin _$TimeSlotModal {
  int get id => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSlotModalCopyWith<TimeSlotModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotModalCopyWith<$Res> {
  factory $TimeSlotModalCopyWith(
          TimeSlotModal value, $Res Function(TimeSlotModal) then) =
      _$TimeSlotModalCopyWithImpl<$Res>;
  $Res call({int id, String time});
}

/// @nodoc
class _$TimeSlotModalCopyWithImpl<$Res>
    implements $TimeSlotModalCopyWith<$Res> {
  _$TimeSlotModalCopyWithImpl(this._value, this._then);

  final TimeSlotModal _value;
  // ignore: unused_field
  final $Res Function(TimeSlotModal) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TimeSlotModalCopyWith<$Res>
    implements $TimeSlotModalCopyWith<$Res> {
  factory _$$_TimeSlotModalCopyWith(
          _$_TimeSlotModal value, $Res Function(_$_TimeSlotModal) then) =
      __$$_TimeSlotModalCopyWithImpl<$Res>;
  @override
  $Res call({int id, String time});
}

/// @nodoc
class __$$_TimeSlotModalCopyWithImpl<$Res>
    extends _$TimeSlotModalCopyWithImpl<$Res>
    implements _$$_TimeSlotModalCopyWith<$Res> {
  __$$_TimeSlotModalCopyWithImpl(
      _$_TimeSlotModal _value, $Res Function(_$_TimeSlotModal) _then)
      : super(_value, (v) => _then(v as _$_TimeSlotModal));

  @override
  _$_TimeSlotModal get _value => super._value as _$_TimeSlotModal;

  @override
  $Res call({
    Object? id = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_TimeSlotModal(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeSlotModal implements _TimeSlotModal {
  const _$_TimeSlotModal({required this.id, required this.time});

  factory _$_TimeSlotModal.fromJson(Map<String, dynamic> json) =>
      _$$_TimeSlotModalFromJson(json);

  @override
  final int id;
  @override
  final String time;

  @override
  String toString() {
    return 'TimeSlotModal(id: $id, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimeSlotModal &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_TimeSlotModalCopyWith<_$_TimeSlotModal> get copyWith =>
      __$$_TimeSlotModalCopyWithImpl<_$_TimeSlotModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeSlotModalToJson(
      this,
    );
  }
}

abstract class _TimeSlotModal implements TimeSlotModal {
  const factory _TimeSlotModal(
      {required final int id, required final String time}) = _$_TimeSlotModal;

  factory _TimeSlotModal.fromJson(Map<String, dynamic> json) =
      _$_TimeSlotModal.fromJson;

  @override
  int get id;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_TimeSlotModalCopyWith<_$_TimeSlotModal> get copyWith =>
      throw _privateConstructorUsedError;
}
