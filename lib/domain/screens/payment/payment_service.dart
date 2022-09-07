import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/payment/payment_history/payment_history.dart';
import 'package:dartz/dartz.dart';

abstract class PaymentService {
  Future<Either<CommonFailures, List<PaymentHistoryModal>>>
      getPaymentHistoryList();
}
