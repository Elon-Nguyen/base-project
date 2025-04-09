
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:base_project/data/models/user_model.dart';

import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client = http.Client();

  UserRemoteDataSourceImpl();

  @override
  Future<UserModel> getUserDetails(String userId) async {
    final response = await client.get(Uri.parse('https://api.example.com/users/$userId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UserModel(id: data['id'], name: data['name'], email: data['email']);
    } else {
      throw Exception('Failed to load user');
    }
  }
}