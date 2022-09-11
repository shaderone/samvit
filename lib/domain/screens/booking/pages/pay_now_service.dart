import 'package:samvit/domain/common_failures/common_failures.dart';
import 'package:samvit/domain/screens/booking/modals/pay_now/pay_now.dart';
import 'package:dartz/dartz.dart';

abstract class PayNowService {
  Future<Either<CommonFailures, PayNowPageModal>> generateQrCode();
}
