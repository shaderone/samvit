import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_history.freezed.dart';
part 'payment_history.g.dart';

@freezed
class PaymentHistoryModal with _$PaymentHistoryModal {
  const factory PaymentHistoryModal({
    required int id,
    //@JsonKey(name: "college") required String collegeName,
    @JsonKey(name: "payment_type") required String paymentType,
    @JsonKey(name: "payment_status") required String paymentStatus,
  }) = _PaymentHistoryModal;

  factory PaymentHistoryModal.fromJson(Map<String, dynamic> json) =>
      _$PaymentHistoryModalFromJson(json);
}
