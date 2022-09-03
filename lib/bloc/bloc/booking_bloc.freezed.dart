// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'booking_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) getTime,
    required TResult Function() getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTime value) getTime,
    required TResult Function(_GetSlotInfo value) getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEventCopyWith<$Res> {
  factory $BookingEventCopyWith(
          BookingEvent value, $Res Function(BookingEvent) then) =
      _$BookingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BookingEventCopyWithImpl<$Res> implements $BookingEventCopyWith<$Res> {
  _$BookingEventCopyWithImpl(this._value, this._then);

  final BookingEvent _value;
  // ignore: unused_field
  final $Res Function(BookingEvent) _then;
}

/// @nodoc
abstract class _$$_GetTimeCopyWith<$Res> {
  factory _$$_GetTimeCopyWith(
          _$_GetTime value, $Res Function(_$_GetTime) then) =
      __$$_GetTimeCopyWithImpl<$Res>;
  $Res call({String date});
}

/// @nodoc
class __$$_GetTimeCopyWithImpl<$Res> extends _$BookingEventCopyWithImpl<$Res>
    implements _$$_GetTimeCopyWith<$Res> {
  __$$_GetTimeCopyWithImpl(_$_GetTime _value, $Res Function(_$_GetTime) _then)
      : super(_value, (v) => _then(v as _$_GetTime));

  @override
  _$_GetTime get _value => super._value as _$_GetTime;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$_GetTime(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetTime implements _GetTime {
  const _$_GetTime({required this.date});

  @override
  final String date;

  @override
  String toString() {
    return 'BookingEvent.getTime(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTime &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_GetTimeCopyWith<_$_GetTime> get copyWith =>
      __$$_GetTimeCopyWithImpl<_$_GetTime>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) getTime,
    required TResult Function() getSlotInfo,
  }) {
    return getTime(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
  }) {
    return getTime?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getTime != null) {
      return getTime(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTime value) getTime,
    required TResult Function(_GetSlotInfo value) getSlotInfo,
  }) {
    return getTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
  }) {
    return getTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getTime != null) {
      return getTime(this);
    }
    return orElse();
  }
}

abstract class _GetTime implements BookingEvent {
  const factory _GetTime({required final String date}) = _$_GetTime;

  String get date;
  @JsonKey(ignore: true)
  _$$_GetTimeCopyWith<_$_GetTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetSlotInfoCopyWith<$Res> {
  factory _$$_GetSlotInfoCopyWith(
          _$_GetSlotInfo value, $Res Function(_$_GetSlotInfo) then) =
      __$$_GetSlotInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetSlotInfoCopyWithImpl<$Res>
    extends _$BookingEventCopyWithImpl<$Res>
    implements _$$_GetSlotInfoCopyWith<$Res> {
  __$$_GetSlotInfoCopyWithImpl(
      _$_GetSlotInfo _value, $Res Function(_$_GetSlotInfo) _then)
      : super(_value, (v) => _then(v as _$_GetSlotInfo));

  @override
  _$_GetSlotInfo get _value => super._value as _$_GetSlotInfo;
}

/// @nodoc

class _$_GetSlotInfo implements _GetSlotInfo {
  const _$_GetSlotInfo();

  @override
  String toString() {
    return 'BookingEvent.getSlotInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetSlotInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) getTime,
    required TResult Function() getSlotInfo,
  }) {
    return getSlotInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
  }) {
    return getSlotInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? getTime,
    TResult Function()? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getSlotInfo != null) {
      return getSlotInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTime value) getTime,
    required TResult Function(_GetSlotInfo value) getSlotInfo,
  }) {
    return getSlotInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
  }) {
    return getSlotInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTime value)? getTime,
    TResult Function(_GetSlotInfo value)? getSlotInfo,
    required TResult orElse(),
  }) {
    if (getSlotInfo != null) {
      return getSlotInfo(this);
    }
    return orElse();
  }
}

abstract class _GetSlotInfo implements BookingEvent {
  const factory _GetSlotInfo() = _$_GetSlotInfo;
}

/// @nodoc
mixin _$BookingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<TimeSlotModal> get timeSlotList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isError, List<TimeSlotModal> timeSlotList});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res> implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  final BookingState _value;
  // ignore: unused_field
  final $Res Function(BookingState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? timeSlotList = freezed,
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
      timeSlotList: timeSlotList == freezed
          ? _value.timeSlotList
          : timeSlotList // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModal>,
    ));
  }
}

/// @nodoc
abstract class _$$_BookingStateCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$_BookingStateCopyWith(
          _$_BookingState value, $Res Function(_$_BookingState) then) =
      __$$_BookingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isError, List<TimeSlotModal> timeSlotList});
}

/// @nodoc
class __$$_BookingStateCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res>
    implements _$$_BookingStateCopyWith<$Res> {
  __$$_BookingStateCopyWithImpl(
      _$_BookingState _value, $Res Function(_$_BookingState) _then)
      : super(_value, (v) => _then(v as _$_BookingState));

  @override
  _$_BookingState get _value => super._value as _$_BookingState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? timeSlotList = freezed,
  }) {
    return _then(_$_BookingState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      timeSlotList: timeSlotList == freezed
          ? _value._timeSlotList
          : timeSlotList // ignore: cast_nullable_to_non_nullable
              as List<TimeSlotModal>,
    ));
  }
}

/// @nodoc

class _$_BookingState implements _BookingState {
  const _$_BookingState(
      {required this.isLoading,
      required this.isError,
      required final List<TimeSlotModal> timeSlotList})
      : _timeSlotList = timeSlotList;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<TimeSlotModal> _timeSlotList;
  @override
  List<TimeSlotModal> get timeSlotList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeSlotList);
  }

  @override
  String toString() {
    return 'BookingState(isLoading: $isLoading, isError: $isError, timeSlotList: $timeSlotList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other._timeSlotList, _timeSlotList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(_timeSlotList));

  @JsonKey(ignore: true)
  @override
  _$$_BookingStateCopyWith<_$_BookingState> get copyWith =>
      __$$_BookingStateCopyWithImpl<_$_BookingState>(this, _$identity);
}

abstract class _BookingState implements BookingState {
  const factory _BookingState(
      {required final bool isLoading,
      required final bool isError,
      required final List<TimeSlotModal> timeSlotList}) = _$_BookingState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<TimeSlotModal> get timeSlotList;
  @override
  @JsonKey(ignore: true)
  _$$_BookingStateCopyWith<_$_BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}
