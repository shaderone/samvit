import 'package:freezed_annotation/freezed_annotation.dart';
part 'pay_now.freezed.dart';
part 'pay_now.g.dart';

@freezed
class PayNowPageModal with _$PayNowPageModal {
  const factory PayNowPageModal({
    @JsonKey(name: "url") required String url,
  }) = _PayNowPageModal;

  factory PayNowPageModal.fromJson(Map<String, dynamic> json) =>
      _$PayNowPageModalFromJson(json);
}
