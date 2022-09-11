import 'package:samvit/domain/common_failures/common_failures.dart';
import 'package:samvit/domain/screens/booking/modals/slot_info/slot_info.dart';
import 'package:dartz/dartz.dart';

abstract class SlotInfoService {
  Future<Either<CommonFailures, SlotInfoModal>> getSlotInfo({
    required String date,
    required String time,
  });
}
