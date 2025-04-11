import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_controller.dart';
import 'package:get/get.dart';

class UserViewModel {
  late final UserController _userController;

  UserViewModel() {
    // Get the controller instance using GetX dependency injection
    _userController = Get.find<UserController>();
  }

  // Alternative constructor if you want to inject the controller manually
  UserViewModel.withController(this._userController);

  Future<void> fetchUserDetails(String userId) async {
    await _userController.fetchUserDetails(userId);
  }

  // Using getters that access the controller properties
  bool get isLoading => _userController.isLoading;
  User? get user => _userController.user;
}
