// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getReservationList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getReservationList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getReservationList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReservationList value) getReservationList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetReservationList value)? getReservationList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReservationList value)? getReservationList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationEventCopyWith<$Res> {
  factory $ReservationEventCopyWith(
          ReservationEvent value, $Res Function(ReservationEvent) then) =
      _$ReservationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReservationEventCopyWithImpl<$Res>
    implements $ReservationEventCopyWith<$Res> {
  _$ReservationEventCopyWithImpl(this._value, this._then);

  final ReservationEvent _value;
  // ignore: unused_field
  final $Res Function(ReservationEvent) _then;
}

/// @nodoc
abstract class _$$_GetReservationListCopyWith<$Res> {
  factory _$$_GetReservationListCopyWith(_$_GetReservationList value,
          $Res Function(_$_GetReservationList) then) =
      __$$_GetReservationListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetReservationListCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res>
    implements _$$_GetReservationListCopyWith<$Res> {
  __$$_GetReservationListCopyWithImpl(
      _$_GetReservationList _value, $Res Function(_$_GetReservationList) _then)
      : super(_value, (v) => _then(v as _$_GetReservationList));

  @override
  _$_GetReservationList get _value => super._value as _$_GetReservationList;
}

/// @nodoc

class _$_GetReservationList implements _GetReservationList {
  const _$_GetReservationList();

  @override
  String toString() {
    return 'ReservationEvent.getReservationList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetReservationList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getReservationList,
  }) {
    return getReservationList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getReservationList,
  }) {
    return getReservationList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getReservationList,
    required TResult orElse(),
  }) {
    if (getReservationList != null) {
      return getReservationList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetReservationList value) getReservationList,
  }) {
    return getReservationList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetReservationList value)? getReservationList,
  }) {
    return getReservationList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetReservationList value)? getReservationList,
    required TResult orElse(),
  }) {
    if (getReservationList != null) {
      return getReservationList(this);
    }
    return orElse();
  }
}

abstract class _GetReservationList implements ReservationEvent {
  const factory _GetReservationList() = _$_GetReservationList;
}

/// @nodoc
mixin _$ReservationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<ReservationModal> get reservationList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationStateCopyWith<ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationStateCopyWith<$Res> {
  factory $ReservationStateCopyWith(
          ReservationState value, $Res Function(ReservationState) then) =
      _$ReservationStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, bool isError, List<ReservationModal> reservationList});
}

/// @nodoc
class _$ReservationStateCopyWithImpl<$Res>
    implements $ReservationStateCopyWith<$Res> {
  _$ReservationStateCopyWithImpl(this._value, this._then);

  final ReservationState _value;
  // ignore: unused_field
  final $Res Function(ReservationState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? reservationList = freezed,
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
      reservationList: reservationList == freezed
          ? _value.reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationModal>,
    ));
  }
}

/// @nodoc
abstract class _$$_ReservationStateCopyWith<$Res>
    implements $ReservationStateCopyWith<$Res> {
  factory _$$_ReservationStateCopyWith(
          _$_ReservationState value, $Res Function(_$_ReservationState) then) =
      __$$_ReservationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, bool isError, List<ReservationModal> reservationList});
}

/// @nodoc
class __$$_ReservationStateCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res>
    implements _$$_ReservationStateCopyWith<$Res> {
  __$$_ReservationStateCopyWithImpl(
      _$_ReservationState _value, $Res Function(_$_ReservationState) _then)
      : super(_value, (v) => _then(v as _$_ReservationState));

  @override
  _$_ReservationState get _value => super._value as _$_ReservationState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isError = freezed,
    Object? reservationList = freezed,
  }) {
    return _then(_$_ReservationState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      reservationList: reservationList == freezed
          ? _value._reservationList
          : reservationList // ignore: cast_nullable_to_non_nullable
              as List<ReservationModal>,
    ));
  }
}

/// @nodoc

class _$_ReservationState implements _ReservationState {
  const _$_ReservationState(
      {required this.isLoading,
      required this.isError,
      required final List<ReservationModal> reservationList})
      : _reservationList = reservationList;

  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<ReservationModal> _reservationList;
  @override
  List<ReservationModal> get reservationList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reservationList);
  }

  @override
  String toString() {
    return 'ReservationState(isLoading: $isLoading, isError: $isError, reservationList: $reservationList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other._reservationList, _reservationList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(_reservationList));

  @JsonKey(ignore: true)
  @override
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      __$$_ReservationStateCopyWithImpl<_$_ReservationState>(this, _$identity);
}

abstract class _ReservationState implements ReservationState {
  const factory _ReservationState(
          {required final bool isLoading,
          required final bool isError,
          required final List<ReservationModal> reservationList}) =
      _$_ReservationState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<ReservationModal> get reservationList;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}
