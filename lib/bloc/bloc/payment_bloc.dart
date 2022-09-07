import 'package:bloc/bloc.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/payment/payment_history/payment_history.dart';
import 'package:brechfete/domain/screens/payment/payment_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'payment_event.dart';
part 'payment_state.dart';
part 'payment_bloc.freezed.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentService _paymentService;
  PaymentBloc(this._paymentService) : super(PaymentState.initialState()) {
    on<_GetPaymentList>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      Either<CommonFailures, List<PaymentHistoryModal>> paymentApiResponse =
          await _paymentService.getPaymentHistoryList();

      final currentPaymentState =
          paymentApiResponse.fold((CommonFailures failures) {
        return const PaymentState(
          isError: true,
          isLoading: false,
          paymentList: [],
        );
      }, (List<PaymentHistoryModal> data) {
        return PaymentState(
          isError: false,
          isLoading: false,
          paymentList: data,
        );
      });
      emit(currentPaymentState);
    });
  }
}
