part of 'slot_info_bloc.dart';

@freezed
class SlotInfoState with _$SlotInfoState {
  const factory SlotInfoState({
    required bool isError,
    required bool isLoading,
    required SlotInfoModal slotInfo,
  }) = _SlotInfo;

  factory SlotInfoState.initial() => const SlotInfoState(
        isError: false,
        isLoading: false,
        slotInfo: SlotInfoModal(remainingSlot: 0, bookedSlot: 0),
      );
}
