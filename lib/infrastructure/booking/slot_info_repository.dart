import 'dart:convert';
import 'dart:developer';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/booking/modals/slot_info/slot_info.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/booking/slot_info_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: SlotInfoService)
class SlotInfoRepository implements SlotInfoService {
  @override
  Future<Either<CommonFailures, SlotInfoModal>> getSlotInfo({
    required String date,
    required String time,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final selectedDate = prefs.getString("selectedDate");
    prefs.setString("selectedTime", time);

    var client = http.Client();
    try {
      var res = await client.post(
        Uri.parse("$baseURL/get-slot/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
        body: jsonEncode({'date': selectedDate, 'time': time}),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final timeSlotList = SlotInfoModal.fromJson(data);
        log(timeSlotList.toString());
        return Right(timeSlotList);
      } else {
        return const Left(CommonFailures.serverFailure());
      }
    } catch (_) {
      return const Left(CommonFailures.clientFailure());
    }
  }
}
