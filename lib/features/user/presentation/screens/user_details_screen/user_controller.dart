import 'dart:developer';

import 'package:base_project/core/domain/entities/user.dart';
import 'package:base_project/features/user/domain/usecases/get_user_details.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final GetUserDetails getUserDetails;

  UserController(this.getUserDetails);

  final Rx<User?> _user = Rx<User?>(null);
  final RxBool _isLoading = false.obs;

  // Getter for user
  User? get user => _user.value;

  // Getter for isLoading
  bool get isLoading => _isLoading.value;

  Future<void> fetchUserDetails(String userId) async {
    _isLoading.value = true;
    final result = await getUserDetails.execute(userId);
    _isLoading.value = false;

    result.fold(
      (error) => log('Lỗi: $error'),
      (userData) => _user.value = userData,
    );
  }
}
