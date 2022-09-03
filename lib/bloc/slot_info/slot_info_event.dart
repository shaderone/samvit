part of 'slot_info_bloc.dart';

@freezed
class SlotInfoEvent with _$SlotInfoEvent {
  const factory SlotInfoEvent.getSlotInfo({
    required String date,
    required String time,
  }) = _GetSlotInfo;
}
