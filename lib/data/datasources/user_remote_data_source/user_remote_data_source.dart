// import 'package:base_project/data/models/user_model.dart';
import 'package:base_project/domain/entities/user.dart';

abstract class UserRemoteDataSource {
  // Future<UserModel> getUserDetails(String userId);
  Future<User> getUserDetails(String userId);
}
