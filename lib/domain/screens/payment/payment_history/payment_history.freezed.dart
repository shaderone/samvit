// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentHistoryModal _$PaymentHistoryModalFromJson(Map<String, dynamic> json) {
  return _PaymentHistoryModal.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistoryModal {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "amount")
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "college_name")
  String get collegeName => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_type")
  String get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_status")
  String get paymentStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentHistoryModalCopyWith<PaymentHistoryModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryModalCopyWith<$Res> {
  factory $PaymentHistoryModalCopyWith(
          PaymentHistoryModal value, $Res Function(PaymentHistoryModal) then) =
      _$PaymentHistoryModalCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: "amount") int amount,
      @JsonKey(name: "college_name") String collegeName,
      @JsonKey(name: "payment_type") String paymentType,
      @JsonKey(name: "payment_status") String paymentStatus});
}

/// @nodoc
class _$PaymentHistoryModalCopyWithImpl<$Res>
    implements $PaymentHistoryModalCopyWith<$Res> {
  _$PaymentHistoryModalCopyWithImpl(this._value, this._then);

  final PaymentHistoryModal _value;
  // ignore: unused_field
  final $Res Function(PaymentHistoryModal) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? collegeName = freezed,
    Object? paymentType = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      collegeName: collegeName == freezed
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentHistoryModalCopyWith<$Res>
    implements $PaymentHistoryModalCopyWith<$Res> {
  factory _$$_PaymentHistoryModalCopyWith(_$_PaymentHistoryModal value,
          $Res Function(_$_PaymentHistoryModal) then) =
      __$$_PaymentHistoryModalCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: "amount") int amount,
      @JsonKey(name: "college_name") String collegeName,
      @JsonKey(name: "payment_type") String paymentType,
      @JsonKey(name: "payment_status") String paymentStatus});
}

/// @nodoc
class __$$_PaymentHistoryModalCopyWithImpl<$Res>
    extends _$PaymentHistoryModalCopyWithImpl<$Res>
    implements _$$_PaymentHistoryModalCopyWith<$Res> {
  __$$_PaymentHistoryModalCopyWithImpl(_$_PaymentHistoryModal _value,
      $Res Function(_$_PaymentHistoryModal) _then)
      : super(_value, (v) => _then(v as _$_PaymentHistoryModal));

  @override
  _$_PaymentHistoryModal get _value => super._value as _$_PaymentHistoryModal;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? collegeName = freezed,
    Object? paymentType = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_$_PaymentHistoryModal(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      collegeName: collegeName == freezed
          ? _value.collegeName
          : collegeName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentHistoryModal implements _PaymentHistoryModal {
  const _$_PaymentHistoryModal(
      {required this.id,
      @JsonKey(name: "amount") required this.amount,
      @JsonKey(name: "college_name") required this.collegeName,
      @JsonKey(name: "payment_type") required this.paymentType,
      @JsonKey(name: "payment_status") required this.paymentStatus});

  factory _$_PaymentHistoryModal.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentHistoryModalFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "amount")
  final int amount;
  @override
  @JsonKey(name: "college_name")
  final String collegeName;
  @override
  @JsonKey(name: "payment_type")
  final String paymentType;
  @override
  @JsonKey(name: "payment_status")
  final String paymentStatus;

  @override
  String toString() {
    return 'PaymentHistoryModal(id: $id, amount: $amount, collegeName: $collegeName, paymentType: $paymentType, paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentHistoryModal &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.collegeName, collegeName) &&
            const DeepCollectionEquality()
                .equals(other.paymentType, paymentType) &&
            const DeepCollectionEquality()
                .equals(other.paymentStatus, paymentStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(collegeName),
      const DeepCollectionEquality().hash(paymentType),
      const DeepCollectionEquality().hash(paymentStatus));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentHistoryModalCopyWith<_$_PaymentHistoryModal> get copyWith =>
      __$$_PaymentHistoryModalCopyWithImpl<_$_PaymentHistoryModal>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentHistoryModalToJson(
      this,
    );
  }
}

abstract class _PaymentHistoryModal implements PaymentHistoryModal {
  const factory _PaymentHistoryModal(
      {required final int id,
      @JsonKey(name: "amount")
          required final int amount,
      @JsonKey(name: "college_name")
          required final String collegeName,
      @JsonKey(name: "payment_type")
          required final String paymentType,
      @JsonKey(name: "payment_status")
          required final String paymentStatus}) = _$_PaymentHistoryModal;

  factory _PaymentHistoryModal.fromJson(Map<String, dynamic> json) =
      _$_PaymentHistoryModal.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "amount")
  int get amount;
  @override
  @JsonKey(name: "college_name")
  String get collegeName;
  @override
  @JsonKey(name: "payment_type")
  String get paymentType;
  @override
  @JsonKey(name: "payment_status")
  String get paymentStatus;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentHistoryModalCopyWith<_$_PaymentHistoryModal> get copyWith =>
      throw _privateConstructorUsedError;
}
