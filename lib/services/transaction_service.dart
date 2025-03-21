import 'dart:convert';

import 'package:flutter_sha/models/topup_form_model.dart';
import 'package:flutter_sha/services/auth_service.dart';
import 'package:flutter_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
