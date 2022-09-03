part of 'booking_bloc.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    required bool isLoading,
    required bool isError,
    required List<TimeSlotModal> timeSlotList,
  }) = _BookingState;

  factory BookingState.initial() => const BookingState(
        isLoading: false,
        isError: false,
        timeSlotList: [],
      );
}
