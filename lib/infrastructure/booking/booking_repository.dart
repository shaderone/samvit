import 'dart:convert';
import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/booking/booking_service.dart';
import 'package:brechfete/domain/screens/booking/modals/time_slot/time_slot.dart';
import 'package:dartz/dartz.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: BookingService)
class BookingRepository implements BookingService {
  @override
  Future<Either<CommonFailures, List<TimeSlotModal>>> getTime({
    required String date,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    prefs.setString("selectedDate", date);

    var client = http.Client();
    try {
      var res = await client.post(
        Uri.parse("$baseURL/get-time/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
        body: jsonEncode({'date': date}),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final timeSlotList = (data as List).map((item) {
          return TimeSlotModal.fromJson(item);
        }).toList();
        return Right(timeSlotList);
      } else {
        return const Left(CommonFailures.serverFailure());
      }
    } catch (_) {
      return const Left(CommonFailures.clientFailure());
    }
  }
}
