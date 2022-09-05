import 'package:freezed_annotation/freezed_annotation.dart';
part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class ReservationModal with _$ReservationModal {
  const factory ReservationModal({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "no_of_seat") required int slotCount,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "address") required String address,
    @JsonKey(name: "date") required String date,
    @JsonKey(name: "time") required String time,
  }) = _ReservationModal;

  factory ReservationModal.fromJson(Map<String, dynamic> json) =>
      _$ReservationModalFromJson(json);
}
