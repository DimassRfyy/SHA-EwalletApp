import 'dart:convert';

import 'package:flutter_sha/models/payment_method_model.dart';
import 'package:flutter_sha/services/auth_service.dart';
import 'package:flutter_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        final List<PaymentMethodModel> paymentMethods =
            data.map((item) => PaymentMethodModel.fromJson(item)).toList();

        return paymentMethods;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
