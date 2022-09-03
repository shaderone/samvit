// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slot_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotInfoModal _$SlotInfoModalFromJson(Map<String, dynamic> json) {
  return _SlotInfoModal.fromJson(json);
}

/// @nodoc
mixin _$SlotInfoModal {
  @JsonKey(name: "no_slot")
  int get remainingSlot => throw _privateConstructorUsedError;
  @JsonKey(name: "no_bookedslot")
  int get bookedSlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotInfoModalCopyWith<SlotInfoModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotInfoModalCopyWith<$Res> {
  factory $SlotInfoModalCopyWith(
          SlotInfoModal value, $Res Function(SlotInfoModal) then) =
      _$SlotInfoModalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "no_slot") int remainingSlot,
      @JsonKey(name: "no_bookedslot") int bookedSlot});
}

/// @nodoc
class _$SlotInfoModalCopyWithImpl<$Res>
    implements $SlotInfoModalCopyWith<$Res> {
  _$SlotInfoModalCopyWithImpl(this._value, this._then);

  final SlotInfoModal _value;
  // ignore: unused_field
  final $Res Function(SlotInfoModal) _then;

  @override
  $Res call({
    Object? remainingSlot = freezed,
    Object? bookedSlot = freezed,
  }) {
    return _then(_value.copyWith(
      remainingSlot: remainingSlot == freezed
          ? _value.remainingSlot
          : remainingSlot // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSlot: bookedSlot == freezed
          ? _value.bookedSlot
          : bookedSlot // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SlotInfoModalCopyWith<$Res>
    implements $SlotInfoModalCopyWith<$Res> {
  factory _$$_SlotInfoModalCopyWith(
          _$_SlotInfoModal value, $Res Function(_$_SlotInfoModal) then) =
      __$$_SlotInfoModalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "no_slot") int remainingSlot,
      @JsonKey(name: "no_bookedslot") int bookedSlot});
}

/// @nodoc
class __$$_SlotInfoModalCopyWithImpl<$Res>
    extends _$SlotInfoModalCopyWithImpl<$Res>
    implements _$$_SlotInfoModalCopyWith<$Res> {
  __$$_SlotInfoModalCopyWithImpl(
      _$_SlotInfoModal _value, $Res Function(_$_SlotInfoModal) _then)
      : super(_value, (v) => _then(v as _$_SlotInfoModal));

  @override
  _$_SlotInfoModal get _value => super._value as _$_SlotInfoModal;

  @override
  $Res call({
    Object? remainingSlot = freezed,
    Object? bookedSlot = freezed,
  }) {
    return _then(_$_SlotInfoModal(
      remainingSlot: remainingSlot == freezed
          ? _value.remainingSlot
          : remainingSlot // ignore: cast_nullable_to_non_nullable
              as int,
      bookedSlot: bookedSlot == freezed
          ? _value.bookedSlot
          : bookedSlot // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlotInfoModal implements _SlotInfoModal {
  const _$_SlotInfoModal(
      {@JsonKey(name: "no_slot") required this.remainingSlot,
      @JsonKey(name: "no_bookedslot") required this.bookedSlot});

  factory _$_SlotInfoModal.fromJson(Map<String, dynamic> json) =>
      _$$_SlotInfoModalFromJson(json);

  @override
  @JsonKey(name: "no_slot")
  final int remainingSlot;
  @override
  @JsonKey(name: "no_bookedslot")
  final int bookedSlot;

  @override
  String toString() {
    return 'SlotInfoModal(remainingSlot: $remainingSlot, bookedSlot: $bookedSlot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlotInfoModal &&
            const DeepCollectionEquality()
                .equals(other.remainingSlot, remainingSlot) &&
            const DeepCollectionEquality()
                .equals(other.bookedSlot, bookedSlot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(remainingSlot),
      const DeepCollectionEquality().hash(bookedSlot));

  @JsonKey(ignore: true)
  @override
  _$$_SlotInfoModalCopyWith<_$_SlotInfoModal> get copyWith =>
      __$$_SlotInfoModalCopyWithImpl<_$_SlotInfoModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotInfoModalToJson(
      this,
    );
  }
}

abstract class _SlotInfoModal implements SlotInfoModal {
  const factory _SlotInfoModal(
          {@JsonKey(name: "no_slot") required final int remainingSlot,
          @JsonKey(name: "no_bookedslot") required final int bookedSlot}) =
      _$_SlotInfoModal;

  factory _SlotInfoModal.fromJson(Map<String, dynamic> json) =
      _$_SlotInfoModal.fromJson;

  @override
  @JsonKey(name: "no_slot")
  int get remainingSlot;
  @override
  @JsonKey(name: "no_bookedslot")
  int get bookedSlot;
  @override
  @JsonKey(ignore: true)
  _$$_SlotInfoModalCopyWith<_$_SlotInfoModal> get copyWith =>
      throw _privateConstructorUsedError;
}
