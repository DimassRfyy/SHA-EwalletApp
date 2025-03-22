import 'dart:convert';
import 'package:flutter_sha/models/user_edit_form_model.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/services/auth_service.dart';
import 'package:flutter_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {'Authorization': token},
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getRecentUsers() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/transfer_histories'),
        headers: {'Authorization': token},
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }

      final List<dynamic> data = jsonDecode(res.body)['data'];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getUsersByUsername(String username) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/users/$username'),
        headers: {'Authorization': token},
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }

      final List<dynamic> data = jsonDecode(res.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
