// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paynow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaynowEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? generateQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateQrCode value) generateQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenerateQrCode value)? generateQrCode,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateQrCode value)? generateQrCode,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaynowEventCopyWith<$Res> {
  factory $PaynowEventCopyWith(
          PaynowEvent value, $Res Function(PaynowEvent) then) =
      _$PaynowEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PaynowEventCopyWithImpl<$Res> implements $PaynowEventCopyWith<$Res> {
  _$PaynowEventCopyWithImpl(this._value, this._then);

  final PaynowEvent _value;
  // ignore: unused_field
  final $Res Function(PaynowEvent) _then;
}

/// @nodoc
abstract class _$$GenerateQrCodeCopyWith<$Res> {
  factory _$$GenerateQrCodeCopyWith(
          _$GenerateQrCode value, $Res Function(_$GenerateQrCode) then) =
      __$$GenerateQrCodeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GenerateQrCodeCopyWithImpl<$Res>
    extends _$PaynowEventCopyWithImpl<$Res>
    implements _$$GenerateQrCodeCopyWith<$Res> {
  __$$GenerateQrCodeCopyWithImpl(
      _$GenerateQrCode _value, $Res Function(_$GenerateQrCode) _then)
      : super(_value, (v) => _then(v as _$GenerateQrCode));

  @override
  _$GenerateQrCode get _value => super._value as _$GenerateQrCode;
}

/// @nodoc

class _$GenerateQrCode implements GenerateQrCode {
  const _$GenerateQrCode();

  @override
  String toString() {
    return 'PaynowEvent.generateQrCode()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GenerateQrCode);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() generateQrCode,
  }) {
    return generateQrCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? generateQrCode,
  }) {
    return generateQrCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? generateQrCode,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateQrCode value) generateQrCode,
  }) {
    return generateQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GenerateQrCode value)? generateQrCode,
  }) {
    return generateQrCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateQrCode value)? generateQrCode,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode(this);
    }
    return orElse();
  }
}

abstract class GenerateQrCode implements PaynowEvent {
  const factory GenerateQrCode() = _$GenerateQrCode;
}

/// @nodoc
mixin _$PaynowState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isQrGenerated => throw _privateConstructorUsedError;
  PayNowPageModal get paymentUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaynowStateCopyWith<PaynowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaynowStateCopyWith<$Res> {
  factory $PaynowStateCopyWith(
          PaynowState value, $Res Function(PaynowState) then) =
      _$PaynowStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isError,
      bool isQrGenerated,
      PayNowPageModal paymentUrl});

  $PayNowPageModalCopyWith<$Res> get paymentUrl;
}

/// @nodoc
class _$PaynowStateCopyWithImpl<$Res> implements $PaynowStateCopyWith<$Res> {
  _$PaynowStateCopyWithImpl(this._value, this._then);

  final PaynowState _value;
  // ignore: unused_field
  final $Res Function(PaynowState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? isQrGenerated = freezed,
    Object? paymentUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isQrGenerated: isQrGenerated == freezed
          ? _value.isQrGenerated
          : isQrGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: paymentUrl == freezed
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as PayNowPageModal,
    ));
  }

  @override
  $PayNowPageModalCopyWith<$Res> get paymentUrl {
    return $PayNowPageModalCopyWith<$Res>(_value.paymentUrl, (value) {
      return _then(_value.copyWith(paymentUrl: value));
    });
  }
}

/// @nodoc
abstract class _$$_PayNowCopyWith<$Res> implements $PaynowStateCopyWith<$Res> {
  factory _$$_PayNowCopyWith(_$_PayNow value, $Res Function(_$_PayNow) then) =
      __$$_PayNowCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isError,
      bool isQrGenerated,
      PayNowPageModal paymentUrl});

  @override
  $PayNowPageModalCopyWith<$Res> get paymentUrl;
}

/// @nodoc
class __$$_PayNowCopyWithImpl<$Res> extends _$PaynowStateCopyWithImpl<$Res>
    implements _$$_PayNowCopyWith<$Res> {
  __$$_PayNowCopyWithImpl(_$_PayNow _value, $Res Function(_$_PayNow) _then)
      : super(_value, (v) => _then(v as _$_PayNow));

  @override
  _$_PayNow get _value => super._value as _$_PayNow;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? isQrGenerated = freezed,
    Object? paymentUrl = freezed,
  }) {
    return _then(_$_PayNow(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isQrGenerated: isQrGenerated == freezed
          ? _value.isQrGenerated
          : isQrGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentUrl: paymentUrl == freezed
          ? _value.paymentUrl
          : paymentUrl // ignore: cast_nullable_to_non_nullable
              as PayNowPageModal,
    ));
  }
}

/// @nodoc

class _$_PayNow implements _PayNow {
  const _$_PayNow(
      {required this.isLoading,
      required this.isError,
      required this.isQrGenerated,
      required this.paymentUrl});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final bool isQrGenerated;
  @override
  final PayNowPageModal paymentUrl;

  @override
  String toString() {
    return 'PaynowState(isLoading: $isLoading, isError: $isError, isQrGenerated: $isQrGenerated, paymentUrl: $paymentUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayNow &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other.isQrGenerated, isQrGenerated) &&
            const DeepCollectionEquality()
                .equals(other.paymentUrl, paymentUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isQrGenerated),
      const DeepCollectionEquality().hash(paymentUrl));

  @JsonKey(ignore: true)
  @override
  _$$_PayNowCopyWith<_$_PayNow> get copyWith =>
      __$$_PayNowCopyWithImpl<_$_PayNow>(this, _$identity);
}

abstract class _PayNow implements PaynowState {
  const factory _PayNow(
      {required final bool isLoading,
      required final bool isError,
      required final bool isQrGenerated,
      required final PayNowPageModal paymentUrl}) = _$_PayNow;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isQrGenerated;
  @override
  PayNowPageModal get paymentUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PayNowCopyWith<_$_PayNow> get copyWith =>
      throw _privateConstructorUsedError;
}
