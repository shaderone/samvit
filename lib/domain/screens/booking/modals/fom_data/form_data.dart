import 'package:freezed_annotation/freezed_annotation.dart';
part 'form_data.freezed.dart';
part 'form_data.g.dart';

@freezed
class FormDataModal with _$FormDataModal {
  const factory FormDataModal({
    required String selectedDate,
    required String selectedTime,
    required String slotcount,
    required String cname,
    required String cnmail,
    required String cphone,
    required String ctelorphone,
    required String fname,
    required String femail,
    required String fphone,
    required String ftelorphone,
  }) = _FormDataModal;

  factory FormDataModal.fromJson(Map<String, dynamic> json) =>
      _$FormDataModalFromJson(json);
}
