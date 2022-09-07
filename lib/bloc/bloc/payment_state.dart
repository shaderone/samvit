part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required bool isError,
    required bool isLoading,
    required List<PaymentHistoryModal> paymentList,
  }) = _PaymentState;

  factory PaymentState.initialState() => const PaymentState(
        isError: false,
        isLoading: false,
        paymentList: [],
      );
}
