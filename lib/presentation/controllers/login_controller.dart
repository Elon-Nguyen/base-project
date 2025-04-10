import 'package:base_project/presentation/constants/router_name.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  final TextEditingController userNameEditController = TextEditingController();
  final TextEditingController passwordEditController = TextEditingController();

  RxString erroText = ''.obs;

  String validateLogin() {
    if (userNameEditController.text.trim().isEmpty) return 'Username emtpy';
    if (passwordEditController.text.trim().isEmpty) return 'Password emtpy';
    return '';
  }

  void onClickLogin() {
    erroText.value = validateLogin();
    if (erroText.value.isEmpty) {
      Get.to(UserDetailsScreen.new, routeName: RouterName.userDetail);
    }
  }
}
