import 'package:base_project/core/network/api_service.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/domain/entities/user.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService apiService = ApiService();

  UserRemoteDataSourceImpl();

  @override
  Future<User> getUserDetails(String userId) async {
    final response = await apiService.get<Map<String, dynamic>>('/users/1');

    return User.fromJson(response);
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
