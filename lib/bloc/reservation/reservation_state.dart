part of 'reservation_bloc.dart';

@freezed
class ReservationState with _$ReservationState {
  const factory ReservationState({
    required bool isLoading,
    required bool isError,
    required List<ReservationModal> reservationList,
  }) = _ReservationState;

  factory ReservationState.initial() => const ReservationState(
        isLoading: false,
        isError: false,
        reservationList: [],
      );
}
