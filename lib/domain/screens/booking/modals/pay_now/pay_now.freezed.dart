// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pay_now.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PayNowPageModal _$PayNowPageModalFromJson(Map<String, dynamic> json) {
  return _PayNowPageModal.fromJson(json);
}

/// @nodoc
mixin _$PayNowPageModal {
  @JsonKey(name: "url")
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayNowPageModalCopyWith<PayNowPageModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayNowPageModalCopyWith<$Res> {
  factory $PayNowPageModalCopyWith(
          PayNowPageModal value, $Res Function(PayNowPageModal) then) =
      _$PayNowPageModalCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "url") String url});
}

/// @nodoc
class _$PayNowPageModalCopyWithImpl<$Res>
    implements $PayNowPageModalCopyWith<$Res> {
  _$PayNowPageModalCopyWithImpl(this._value, this._then);

  final PayNowPageModal _value;
  // ignore: unused_field
  final $Res Function(PayNowPageModal) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PayNowPageModalCopyWith<$Res>
    implements $PayNowPageModalCopyWith<$Res> {
  factory _$$_PayNowPageModalCopyWith(
          _$_PayNowPageModal value, $Res Function(_$_PayNowPageModal) then) =
      __$$_PayNowPageModalCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "url") String url});
}

/// @nodoc
class __$$_PayNowPageModalCopyWithImpl<$Res>
    extends _$PayNowPageModalCopyWithImpl<$Res>
    implements _$$_PayNowPageModalCopyWith<$Res> {
  __$$_PayNowPageModalCopyWithImpl(
      _$_PayNowPageModal _value, $Res Function(_$_PayNowPageModal) _then)
      : super(_value, (v) => _then(v as _$_PayNowPageModal));

  @override
  _$_PayNowPageModal get _value => super._value as _$_PayNowPageModal;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$_PayNowPageModal(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PayNowPageModal implements _PayNowPageModal {
  const _$_PayNowPageModal({@JsonKey(name: "url") required this.url});

  factory _$_PayNowPageModal.fromJson(Map<String, dynamic> json) =>
      _$$_PayNowPageModalFromJson(json);

  @override
  @JsonKey(name: "url")
  final String url;

  @override
  String toString() {
    return 'PayNowPageModal(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayNowPageModal &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_PayNowPageModalCopyWith<_$_PayNowPageModal> get copyWith =>
      __$$_PayNowPageModalCopyWithImpl<_$_PayNowPageModal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PayNowPageModalToJson(
      this,
    );
  }
}

abstract class _PayNowPageModal implements PayNowPageModal {
  const factory _PayNowPageModal(
      {@JsonKey(name: "url") required final String url}) = _$_PayNowPageModal;

  factory _PayNowPageModal.fromJson(Map<String, dynamic> json) =
      _$_PayNowPageModal.fromJson;

  @override
  @JsonKey(name: "url")
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PayNowPageModalCopyWith<_$_PayNowPageModal> get copyWith =>
      throw _privateConstructorUsedError;
}
