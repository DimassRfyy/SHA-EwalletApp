import 'dart:convert';

import 'package:flutter_sha/models/tips_model.dart';
import 'package:flutter_sha/services/auth_service.dart';
import 'package:flutter_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TipsService {
  Future<List<TipsModel>> getTips() async {
    final token = await AuthService().getToken();
    final res = await http.get(
      Uri.parse('$baseUrl/tips'),
      headers: {'Authorization': token},
    );

    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body)['data'];
      final List<TipsModel> tips =
          data.map((item) => TipsModel.fromJson(item)).toList();

      return tips;
    } else {
      throw jsonDecode(res.body)['message'];
    }
  }
}
