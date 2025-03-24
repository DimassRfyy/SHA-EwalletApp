import 'dart:convert';

import 'package:flutter_sha/models/operator_card_model.dart';
import 'package:flutter_sha/services/auth_service.dart';
import 'package:flutter_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class OperatorCardService {
  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/operator_cards'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body)['data'];
        final List<OperatorCardModel> operatorCards =
            data.map((item) => OperatorCardModel.fromJson(item)).toList();

        return operatorCards;
      } else {
        throw jsonDecode(res.body)['message'];  
      }
    } catch (e) {
      rethrow;
    }
  }
}
