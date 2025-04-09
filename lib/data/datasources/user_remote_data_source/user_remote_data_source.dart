
import 'package:base_project/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserDetails(String userId);
}