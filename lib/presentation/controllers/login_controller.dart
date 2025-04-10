import 'dart:developer';

import 'package:base_project/domain/usercases/login_with_email_password.dart';
import 'package:base_project/presentation/constants/router_name.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginWithEmailPassword loginWithEmailPassword;

  LoginController(this.loginWithEmailPassword);

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

    final result = await loginWithEmailPassword.execute(
      userNameEditController.text.trim(),
      passwordEditController.text.trim(),
    );

    result.fold(
      (error) => log('Lỗi: $error'),
      (data) => Get.to(UserDetailsScreen.new, routeName: RouterName.userDetail),
    );
  }
}
