import 'package:base_project/core/errors/server_not_found.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();
  final dio = Dio();
  @override
  // Future<UserModel> getUserDetails(String userId) async {
  Future<User> getUserDetails(String userId) async {
    final response = await dio.get<Map<String, dynamic>>(
      'https://jsonplaceholder.typicode.com/users/1',
    );
    if (response.statusCode == 200) {
      final user = User.fromJson(response.data!);
      return user;
    } else {
      throw ServerNotFound();
    }
  }
}
