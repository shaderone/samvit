import 'package:freezed_annotation/freezed_annotation.dart';
part 'slot_register.freezed.dart';
part 'slot_register.g.dart';

@freezed
class SlotRegisterModal with _$SlotRegisterModal {
  const factory SlotRegisterModal({
    @JsonKey(name: "id") required String registrationToken,
    @JsonKey(name: "is_registered") required bool isRegistered,
    @JsonKey(name: "error") required String registrationError,
  }) = _SlotRegisterModal;

  factory SlotRegisterModal.fromJson(Map<String, dynamic> json) =>
      _$SlotRegisterModalFromJson(json);
}
