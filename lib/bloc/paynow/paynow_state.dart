part of 'paynow_bloc.dart';

@freezed
class PaynowState with _$PaynowState {
  const factory PaynowState({
    required bool isLoading,
    required bool isError,
    required bool isQrGenerated,
    required PayNowPageModal paymentUrl,
  }) = _PayNow;

  factory PaynowState.initial() {
    return const PaynowState(
      isQrGenerated: false,
      paymentUrl: PayNowPageModal(url: ""),
      isError: false,
      isLoading: false,
    );
  }
}
