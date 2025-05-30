import 'dart:convert';

import 'package:flutter_sha/models/data_plan_form_model.dart';
import 'package:flutter_sha/models/topup_form_model.dart';
import 'package:flutter_sha/models/transaction_model.dart';
import 'package:flutter_sha/models/transfer_form_model.dart';
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

  Future<void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> buyDataPackage(DataPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/data_plans'),
        headers: {'Authorization': token},
        body: data.toJson(),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/transactions'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body)['data'];
        final List<TransactionModel> transactions =
            data.map((item) => TransactionModel.fromJson(item)).toList();

        return transactions;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
