part of 'paynow_bloc.dart';

@freezed
class PaynowEvent with _$PaynowEvent {
  const factory PaynowEvent.generateQrCode() = GenerateQrCode;
}
