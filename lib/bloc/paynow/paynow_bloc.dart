import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/booking/modals/pay_now/pay_now.dart';
import 'package:brechfete/domain/screens/booking/pages/pay_now_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'paynow_event.dart';
part 'paynow_state.dart';
part 'paynow_bloc.freezed.dart';

@injectable
class PaynowBloc extends Bloc<PaynowEvent, PaynowState> {
  final PayNowService _payNowService;
  PaynowBloc(this._payNowService) : super(PaynowState.initial()) {
    on<GenerateQrCode>((event, emit) async {
      emit(
        const PaynowState(
          isQrGenerated: false,
          paymentUrl: PayNowPageModal(url: ""),
          isLoading: true,
          isError: false,
        ),
      );

      Either<CommonFailures, PayNowPageModal> getUrlResponse =
          await _payNowService.generateQrCode();

      final currentState = getUrlResponse.fold((l) {
        return const PaynowState(
          isLoading: false,
          isError: true,
          isQrGenerated: false,
          paymentUrl: PayNowPageModal(url: ""),
        );
      }, (PayNowPageModal url) {
        return PaynowState(
          isLoading: false,
          isError: false,
          isQrGenerated: true,
          paymentUrl: url,
        );
      });

      emit(currentState);
    });
  }
}
