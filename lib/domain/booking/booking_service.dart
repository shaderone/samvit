import 'package:brechfete/domain/booking/modals/time_slot/time_slot.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:dartz/dartz.dart';

abstract class BookingService {
  Future<Either<CommonFailures, List<TimeSlotModal>>> getTime({
    required String date,
  });
}
