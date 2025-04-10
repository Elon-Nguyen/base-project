import 'dart:developer';

import 'package:base_project/domain/usercases/login_with_email_password.dart';
import 'package:base_project/presentation/constants/router_name.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController(this.loginWithEmailPassword);

  final LoginWithEmailPassword loginWithEmailPassword;

  final RxBool _isLoading = false.obs;
  // Getter for isLoading
  bool get isLoading => _isLoading.value;

  final TextEditingController userNameEditController = TextEditingController();
  final TextEditingController passwordEditController = TextEditingController();

  RxString erroText = ''.obs;

  String validateLogin() {
    if (userNameEditController.text.trim().isEmpty) return 'Username emtpy';
    if (passwordEditController.text.trim().isEmpty) return 'Password emtpy';
    return '';
  }

  Future<void> onClickLogin() async {
    erroText.value = validateLogin();

    if (erroText.value.isNotEmpty) {
      return;
    }

    _isLoading.value = true;
    final result = await loginWithEmailPassword.execute(
      userNameEditController.text.trim(),
      passwordEditController.text.trim(),
    );
    _isLoading.value = false;

    result.fold(
      (error) => log('Lỗi: $error'),
      (data) => Get.to(UserDetailsScreen.new, routeName: RouterName.userDetail),
    );
  }
}
