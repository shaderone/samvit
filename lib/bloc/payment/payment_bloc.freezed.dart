// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getPaymentList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPaymentList value) getPaymentList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetPaymentList value)? getPaymentList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPaymentList value)? getPaymentList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentEventCopyWith<$Res> {
  factory $PaymentEventCopyWith(
          PaymentEvent value, $Res Function(PaymentEvent) then) =
      _$PaymentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaymentEventCopyWithImpl<$Res> implements $PaymentEventCopyWith<$Res> {
  _$PaymentEventCopyWithImpl(this._value, this._then);

  final PaymentEvent _value;
  // ignore: unused_field
  final $Res Function(PaymentEvent) _then;
}

/// @nodoc
abstract class _$$_GetPaymentListCopyWith<$Res> {
  factory _$$_GetPaymentListCopyWith(
          _$_GetPaymentList value, $Res Function(_$_GetPaymentList) then) =
      __$$_GetPaymentListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetPaymentListCopyWithImpl<$Res>
    extends _$PaymentEventCopyWithImpl<$Res>
    implements _$$_GetPaymentListCopyWith<$Res> {
  __$$_GetPaymentListCopyWithImpl(
      _$_GetPaymentList _value, $Res Function(_$_GetPaymentList) _then)
      : super(_value, (v) => _then(v as _$_GetPaymentList));

  @override
  _$_GetPaymentList get _value => super._value as _$_GetPaymentList;
}

/// @nodoc

class _$_GetPaymentList implements _GetPaymentList {
  const _$_GetPaymentList();

  @override
  String toString() {
    return 'PaymentEvent.getPaymentList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetPaymentList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPaymentList,
  }) {
    return getPaymentList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getPaymentList,
  }) {
    return getPaymentList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPaymentList,
    required TResult orElse(),
  }) {
    if (getPaymentList != null) {
      return getPaymentList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetPaymentList value) getPaymentList,
  }) {
    return getPaymentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetPaymentList value)? getPaymentList,
  }) {
    return getPaymentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetPaymentList value)? getPaymentList,
    required TResult orElse(),
  }) {
    if (getPaymentList != null) {
      return getPaymentList(this);
    }
    return orElse();
  }
}

abstract class _GetPaymentList implements PaymentEvent {
  const factory _GetPaymentList() = _$_GetPaymentList;
}

/// @nodoc
mixin _$PaymentState {
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<PaymentHistoryModal> get paymentList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res>;
  $Res call(
      {bool isError, bool isLoading, List<PaymentHistoryModal> paymentList});
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res> implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  final PaymentState _value;
  // ignore: unused_field
  final $Res Function(PaymentState) _then;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? paymentList = freezed,
  }) {
    return _then(_value.copyWith(
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentList: paymentList == freezed
          ? _value.paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModal>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaymentStateCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$_PaymentStateCopyWith(
          _$_PaymentState value, $Res Function(_$_PaymentState) then) =
      __$$_PaymentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isError, bool isLoading, List<PaymentHistoryModal> paymentList});
}

/// @nodoc
class __$$_PaymentStateCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res>
    implements _$$_PaymentStateCopyWith<$Res> {
  __$$_PaymentStateCopyWithImpl(
      _$_PaymentState _value, $Res Function(_$_PaymentState) _then)
      : super(_value, (v) => _then(v as _$_PaymentState));

  @override
  _$_PaymentState get _value => super._value as _$_PaymentState;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? paymentList = freezed,
  }) {
    return _then(_$_PaymentState(
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentList: paymentList == freezed
          ? _value._paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<PaymentHistoryModal>,
    ));
  }
}

/// @nodoc

class _$_PaymentState implements _PaymentState {
  const _$_PaymentState(
      {required this.isError,
      required this.isLoading,
      required final List<PaymentHistoryModal> paymentList})
      : _paymentList = paymentList;

  @override
  final bool isError;
  @override
  final bool isLoading;
  final List<PaymentHistoryModal> _paymentList;
  @override
  List<PaymentHistoryModal> get paymentList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentList);
  }

  @override
  String toString() {
    return 'PaymentState(isError: $isError, isLoading: $isLoading, paymentList: $paymentList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentState &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._paymentList, _paymentList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_paymentList));

  @JsonKey(ignore: true)
  @override
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      __$$_PaymentStateCopyWithImpl<_$_PaymentState>(this, _$identity);
}

abstract class _PaymentState implements PaymentState {
  const factory _PaymentState(
      {required final bool isError,
      required final bool isLoading,
      required final List<PaymentHistoryModal> paymentList}) = _$_PaymentState;

  @override
  bool get isError;
  @override
  bool get isLoading;
  @override
  List<PaymentHistoryModal> get paymentList;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStateCopyWith<_$_PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
