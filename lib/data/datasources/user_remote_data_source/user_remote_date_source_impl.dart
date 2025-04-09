import 'dart:convert';
import 'package:base_project/core/errors/server_not_found.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:http/http.dart' as http;

import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client = http.Client();

  UserRemoteDataSourceImpl();

  @override
  // Future<UserModel> getUserDetails(String userId) async {
  Future<User> getUserDetails(String userId) async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final user = User.fromJson(json);
      return user;
    } else {
      throw ServerNotFound();
    }
  }
}
