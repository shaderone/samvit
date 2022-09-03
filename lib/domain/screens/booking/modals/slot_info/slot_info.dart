import 'package:freezed_annotation/freezed_annotation.dart';
part 'slot_info.freezed.dart';
part 'slot_info.g.dart';

@freezed
class SlotInfoModal with _$SlotInfoModal {
  const factory SlotInfoModal({
    @JsonKey(name: "no_slot") required int remainingSlot,
    @JsonKey(name: "no_bookedslot") required int bookedSlot,
  }) = _SlotInfoModal;

  factory SlotInfoModal.fromJson(Map<String, dynamic> json) =>
      _$SlotInfoModalFromJson(json);
}
