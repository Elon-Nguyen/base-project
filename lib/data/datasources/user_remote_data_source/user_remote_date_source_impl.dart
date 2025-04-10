import 'package:base_project/core/errors/server_not_found.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/domain/entities/user.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl();

  final dio = Dio();

  @override
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

  @override
  Future<User> login(String email, String password) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    const fakeJson = {
      'id': 1,
      'name': 'Leanne Graham',
      'username': 'Bret',
      'email': 'Sincere@april.biz',
      'address': {
        'street': 'Kulas Light',
        'suite': 'Apt. 556',
        'city': 'Gwenborough',
        'zipcode': '92998-3874',
        'geo': {'lat': '-37.3159', 'lng': '81.1496'},
      },
      'phone': '1-770-736-8031 x56442',
      'website': 'hildegard.org',
      'company': {
        'name': 'Romaguera-Crona',
        'catchPhrase': 'Multi-layered client-server neural-net',
        'bs': 'harness real-time e-markets',
      },
    };

    return User.fromJson(fakeJson);
  }
}
