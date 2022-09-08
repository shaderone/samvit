import 'dart:convert';
import 'dart:developer';

import 'package:brechfete/core/constants.dart';
import 'package:brechfete/domain/screens/payment/payment_history/payment_history.dart';
import 'package:brechfete/domain/common_failures/common_failures.dart';
import 'package:brechfete/domain/screens/payment/payment_service.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PaymentService)
class PaymentRepository implements PaymentService {
  @override
  Future<Either<CommonFailures, List<PaymentHistoryModal>>>
      getPaymentHistoryList() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      final res = await http.get(Uri.parse("$baseURL/payment-list/"), headers: {
        "Content-Type": "application/json",
        "Authorization": "Token $token",
      });

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final paymentList = (data as List)
            .map((item) => PaymentHistoryModal.fromJson(item))
            .toList();
        return Right(paymentList);
      } else {
        return const Left(CommonFailures.serverFailure());
      }
    } catch (e) {
      return const Left(CommonFailures.clientFailure());
    }
  }
}
