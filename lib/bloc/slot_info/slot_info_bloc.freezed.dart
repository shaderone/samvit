// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'slot_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SlotInfoEvent {
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date, String time) getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date, String time)? getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date, String time)? getSlotInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSlotInfo value) getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSlotInfo value)? getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSlotInfo value)? getSlotInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotInfoEventCopyWith<SlotInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotInfoEventCopyWith<$Res> {
  factory $SlotInfoEventCopyWith(
          SlotInfoEvent value, $Res Function(SlotInfoEvent) then) =
      _$SlotInfoEventCopyWithImpl<$Res>;
  $Res call({String date, String time});
}

/// @nodoc
class _$SlotInfoEventCopyWithImpl<$Res>
    implements $SlotInfoEventCopyWith<$Res> {
  _$SlotInfoEventCopyWithImpl(this._value, this._then);

  final SlotInfoEvent _value;
  // ignore: unused_field
  final $Res Function(SlotInfoEvent) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_GetSlotInfoCopyWith<$Res>
    implements $SlotInfoEventCopyWith<$Res> {
  factory _$$_GetSlotInfoCopyWith(
          _$_GetSlotInfo value, $Res Function(_$_GetSlotInfo) then) =
      __$$_GetSlotInfoCopyWithImpl<$Res>;
  @override
  $Res call({String date, String time});
}

/// @nodoc
class __$$_GetSlotInfoCopyWithImpl<$Res>
    extends _$SlotInfoEventCopyWithImpl<$Res>
    implements _$$_GetSlotInfoCopyWith<$Res> {
  __$$_GetSlotInfoCopyWithImpl(
      _$_GetSlotInfo _value, $Res Function(_$_GetSlotInfo) _then)
      : super(_value, (v) => _then(v as _$_GetSlotInfo));

  @override
  _$_GetSlotInfo get _value => super._value as _$_GetSlotInfo;

  @override
  $Res call({
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_GetSlotInfo(
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

class _$_GetSlotInfo implements _GetSlotInfo {
  const _$_GetSlotInfo({required this.date, required this.time});

  @override
  final String date;
  @override
  final String time;

  @override
  String toString() {
    return 'SlotInfoEvent.getSlotInfo(date: $date, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetSlotInfo &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$$_GetSlotInfoCopyWith<_$_GetSlotInfo> get copyWith =>
      __$$_GetSlotInfoCopyWithImpl<_$_GetSlotInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date, String time) getSlotInfo,
  }) {
    return getSlotInfo(date, time);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date, String time)? getSlotInfo,
  }) {
    return getSlotInfo?.call(date, time);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date, String time)? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getSlotInfo != null) {
      return getSlotInfo(date, time);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSlotInfo value) getSlotInfo,
  }) {
    return getSlotInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetSlotInfo value)? getSlotInfo,
  }) {
    return getSlotInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSlotInfo value)? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getSlotInfo != null) {
      return getSlotInfo(this);
    }
    return orElse();
  }
}

abstract class _GetSlotInfo implements SlotInfoEvent {
  const factory _GetSlotInfo(
      {required final String date,
      required final String time}) = _$_GetSlotInfo;

  @override
  String get date;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_GetSlotInfoCopyWith<_$_GetSlotInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SlotInfoState {
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  SlotInfoModal get slotInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SlotInfoStateCopyWith<SlotInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotInfoStateCopyWith<$Res> {
  factory $SlotInfoStateCopyWith(
          SlotInfoState value, $Res Function(SlotInfoState) then) =
      _$SlotInfoStateCopyWithImpl<$Res>;
  $Res call({bool isError, bool isLoading, SlotInfoModal slotInfo});

  $SlotInfoModalCopyWith<$Res> get slotInfo;
}

/// @nodoc
class _$SlotInfoStateCopyWithImpl<$Res>
    implements $SlotInfoStateCopyWith<$Res> {
  _$SlotInfoStateCopyWithImpl(this._value, this._then);

  final SlotInfoState _value;
  // ignore: unused_field
  final $Res Function(SlotInfoState) _then;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? slotInfo = freezed,
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
      slotInfo: slotInfo == freezed
          ? _value.slotInfo
          : slotInfo // ignore: cast_nullable_to_non_nullable
              as SlotInfoModal,
    ));
  }

  @override
  $SlotInfoModalCopyWith<$Res> get slotInfo {
    return $SlotInfoModalCopyWith<$Res>(_value.slotInfo, (value) {
      return _then(_value.copyWith(slotInfo: value));
    });
  }
}

/// @nodoc
abstract class _$$_SlotInfoCopyWith<$Res>
    implements $SlotInfoStateCopyWith<$Res> {
  factory _$$_SlotInfoCopyWith(
          _$_SlotInfo value, $Res Function(_$_SlotInfo) then) =
      __$$_SlotInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool isError, bool isLoading, SlotInfoModal slotInfo});

  @override
  $SlotInfoModalCopyWith<$Res> get slotInfo;
}

/// @nodoc
class __$$_SlotInfoCopyWithImpl<$Res> extends _$SlotInfoStateCopyWithImpl<$Res>
    implements _$$_SlotInfoCopyWith<$Res> {
  __$$_SlotInfoCopyWithImpl(
      _$_SlotInfo _value, $Res Function(_$_SlotInfo) _then)
      : super(_value, (v) => _then(v as _$_SlotInfo));

  @override
  _$_SlotInfo get _value => super._value as _$_SlotInfo;

  @override
  $Res call({
    Object? isError = freezed,
    Object? isLoading = freezed,
    Object? slotInfo = freezed,
  }) {
    return _then(_$_SlotInfo(
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      slotInfo: slotInfo == freezed
          ? _value.slotInfo
          : slotInfo // ignore: cast_nullable_to_non_nullable
              as SlotInfoModal,
    ));
  }
}

/// @nodoc

class _$_SlotInfo implements _SlotInfo {
  const _$_SlotInfo(
      {required this.isError, required this.isLoading, required this.slotInfo});

  @override
  final bool isError;
  @override
  final bool isLoading;
  @override
  final SlotInfoModal slotInfo;

  @override
  String toString() {
    return 'SlotInfoState(isError: $isError, isLoading: $isLoading, slotInfo: $slotInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlotInfo &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.slotInfo, slotInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(slotInfo));

  @JsonKey(ignore: true)
  @override
  _$$_SlotInfoCopyWith<_$_SlotInfo> get copyWith =>
      __$$_SlotInfoCopyWithImpl<_$_SlotInfo>(this, _$identity);
}

abstract class _SlotInfo implements SlotInfoState {
  const factory _SlotInfo(
      {required final bool isError,
      required final bool isLoading,
      required final SlotInfoModal slotInfo}) = _$_SlotInfo;

  @override
  bool get isError;
  @override
  bool get isLoading;
  @override
  SlotInfoModal get slotInfo;
  @override
  @JsonKey(ignore: true)
  _$$_SlotInfoCopyWith<_$_SlotInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
