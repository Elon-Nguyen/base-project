// import 'package:base_project/data/models/user_model.dart';

import 'package:base_project/core/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  Future<User> getUserDetails(String userId);

  Future<User> login(String email, String password);
}
