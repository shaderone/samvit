import 'dart:convert';
import 'package:samvit/core/constants.dart';
import 'package:samvit/domain/screens/booking/modals/pay_now/pay_now.dart';
import 'package:samvit/domain/screens/booking/pages/pay_now_service.dart';
import 'package:dartz/dartz.dart';
import 'package:samvit/domain/common_failures/common_failures.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PayNowService)
class PayNowRepository implements PayNowService {
  @override
  Future<Either<CommonFailures, PayNowPageModal>> generateQrCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final regId = prefs.getString("regToken");

    var client = http.Client();
    try {
      var res = await client.post(
        Uri.parse("$baseURL/payment/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token $token",
        },
        body: jsonEncode({
          "collegeid": regId,
          "type": "onlineqr", //for qrcode
        }),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final url = PayNowPageModal.fromJson(data);
        return Right(url);
      } else {
        return const Left(CommonFailures.serverFailure());
      }
    } catch (_) {
      return const Left(CommonFailures.clientFailure());
    }
  }
}
