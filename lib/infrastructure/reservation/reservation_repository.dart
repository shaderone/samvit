import 'dart:convert';
import 'package:samvit/core/constants.dart';
import 'package:samvit/domain/common_failures/common_failures.dart';
import 'package:samvit/domain/screens/reservation/reservation/reservation.dart';
import 'package:samvit/domain/screens/reservation/reservation_service.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: ReservationService)
class ReservationRepository implements ReservationService {
  @override
  Future<Either<CommonFailures, List<ReservationModal>>>
      getReservationList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var client = http.Client();
    try {
      var res = await client.get(
        Uri.parse("$baseURL/reservation-list/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final reservationList = (data as List).map((item) {
          return ReservationModal.fromJson(item);
        }).toList();
        return Right(reservationList);
      } else {
        return const Left(CommonFailures.serverFailure());
      }
    } catch (_) {
      return const Left(CommonFailures.clientFailure());
    }
  }
}
