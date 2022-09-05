import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/reservation/reservation/reservation.dart';
import 'package:dartz/dartz.dart';

abstract class ReservationService {
  Future<Either<CommonFailures, List<ReservationModal>>> getReservationList();
}
