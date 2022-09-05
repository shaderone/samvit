// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slot_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlotRegisterModal _$SlotRegisterModalFromJson(Map<String, dynamic> json) {
  return _SlotRegisterModal.fromJson(json);
}

/// @nodoc
mixin _$SlotRegisterModal {
  @JsonKey(name: "id")
  String get registrationToken => throw _privateConstructorUsedError;
  @JsonKey(name: "is_registered")
  bool get isRegistered => throw _privateConstructorUsedError;
  @JsonKey(name: "error")
  String get registrationError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotRegisterModalCopyWith<SlotRegisterModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotRegisterModalCopyWith<$Res> {
  factory $SlotRegisterModalCopyWith(
          SlotRegisterModal value, $Res Function(SlotRegisterModal) then) =
      _$SlotRegisterModalCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "id") String registrationToken,
      @JsonKey(name: "is_registered") bool isRegistered,
      @JsonKey(name: "error") String registrationError});
}

/// @nodoc
class _$SlotRegisterModalCopyWithImpl<$Res>
    implements $SlotRegisterModalCopyWith<$Res> {
  _$SlotRegisterModalCopyWithImpl(this._value, this._then);

  final SlotRegisterModal _value;
  // ignore: unused_field
  final $Res Function(SlotRegisterModal) _then;

  @override
  $Res call({
    Object? registrationToken = freezed,
    Object? isRegistered = freezed,
    Object? registrationError = freezed,
  }) {
    return _then(_value.copyWith(
      registrationToken: registrationToken == freezed
          ? _value.registrationToken
          : registrationToken // ignore: cast_nullable_to_non_nullable
              as String,
      isRegistered: isRegistered == freezed
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationError: registrationError == freezed
          ? _value.registrationError
          : registrationError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SlotRegisterModalCopyWith<$Res>
    implements $SlotRegisterModalCopyWith<$Res> {
  factory _$$_SlotRegisterModalCopyWith(_$_SlotRegisterModal value,
          $Res Function(_$_SlotRegisterModal) then) =
      __$$_SlotRegisterModalCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "id") String registrationToken,
      @JsonKey(name: "is_registered") bool isRegistered,
      @JsonKey(name: "error") String registrationError});
}

/// @nodoc
class __$$_SlotRegisterModalCopyWithImpl<$Res>
    extends _$SlotRegisterModalCopyWithImpl<$Res>
    implements _$$_SlotRegisterModalCopyWith<$Res> {
  __$$_SlotRegisterModalCopyWithImpl(
      _$_SlotRegisterModal _value, $Res Function(_$_SlotRegisterModal) _then)
      : super(_value, (v) => _then(v as _$_SlotRegisterModal));

  @override
  _$_SlotRegisterModal get _value => super._value as _$_SlotRegisterModal;

  @override
  $Res call({
    Object? registrationToken = freezed,
    Object? isRegistered = freezed,
    Object? registrationError = freezed,
  }) {
    return _then(_$_SlotRegisterModal(
      registrationToken: registrationToken == freezed
          ? _value.registrationToken
          : registrationToken // ignore: cast_nullable_to_non_nullable
              as String,
      isRegistered: isRegistered == freezed
          ? _value.isRegistered
          : isRegistered // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationError: registrationError == freezed
          ? _value.registrationError
          : registrationError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlotRegisterModal implements _SlotRegisterModal {
  const _$_SlotRegisterModal(
      {@JsonKey(name: "id") required this.registrationToken,
      @JsonKey(name: "is_registered") required this.isRegistered,
      @JsonKey(name: "error") required this.registrationError});

  factory _$_SlotRegisterModal.fromJson(Map<String, dynamic> json) =>
      _$$_SlotRegisterModalFromJson(json);

  @override
  @JsonKey(name: "id")
  final String registrationToken;
  @override
  @JsonKey(name: "is_registered")
  final bool isRegistered;
  @override
  @JsonKey(name: "error")
  final String registrationError;

  @override
  String toString() {
    return 'SlotRegisterModal(registrationToken: $registrationToken, isRegistered: $isRegistered, registrationError: $registrationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlotRegisterModal &&
            const DeepCollectionEquality()
                .equals(other.registrationToken, registrationToken) &&
            const DeepCollectionEquality()
                .equals(other.isRegistered, isRegistered) &&
            const DeepCollectionEquality()
                .equals(other.registrationError, registrationError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(registrationToken),
      const DeepCollectionEquality().hash(isRegistered),
      const DeepCollectionEquality().hash(registrationError));

  @JsonKey(ignore: true)
  @override
  _$$_SlotRegisterModalCopyWith<_$_SlotRegisterModal> get copyWith =>
      __$$_SlotRegisterModalCopyWithImpl<_$_SlotRegisterModal>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotRegisterModalToJson(
      this,
    );
  }
}

abstract class _SlotRegisterModal implements SlotRegisterModal {
  const factory _SlotRegisterModal(
          {@JsonKey(name: "id") required final String registrationToken,
          @JsonKey(name: "is_registered") required final bool isRegistered,
          @JsonKey(name: "error") required final String registrationError}) =
      _$_SlotRegisterModal;

  factory _SlotRegisterModal.fromJson(Map<String, dynamic> json) =
      _$_SlotRegisterModal.fromJson;

  @override
  @JsonKey(name: "id")
  String get registrationToken;
  @override
  @JsonKey(name: "is_registered")
  bool get isRegistered;
  @override
  @JsonKey(name: "error")
  String get registrationError;
  @override
  @JsonKey(ignore: true)
  _$$_SlotRegisterModalCopyWith<_$_SlotRegisterModal> get copyWith =>
      throw _privateConstructorUsedError;
}
