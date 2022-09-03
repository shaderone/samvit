part of 'booking_bloc.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const factory BookingEvent.getTime({
    required String date,
  }) = _GetTime;
  const factory BookingEvent.getSlotInfo() = _GetSlotInfo;
}
