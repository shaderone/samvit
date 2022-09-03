import 'package:freezed_annotation/freezed_annotation.dart';
part 'time_slot.freezed.dart';
part 'time_slot.g.dart';

@freezed
class TimeSlotModal with _$TimeSlotModal {
  const factory TimeSlotModal({
    required int id,
    required String time,
  }) = _TimeSlotModal;

  factory TimeSlotModal.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModalFromJson(json);
}
