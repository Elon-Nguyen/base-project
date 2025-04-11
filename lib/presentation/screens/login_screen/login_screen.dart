import 'package:base_project/core/di/service_locator.dart';
import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/constants/values.dart';
import 'package:base_project/presentation/screens/login_screen/login_controller.dart';
import 'package:base_project/presentation/widgets/button_widget.dart';
import 'package:base_project/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = locator<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppValue.vSpace(AppValue.paddingTop(context)),
            Text('Login Page', style: context.textStyle.size28.w600.blueIndigo),
            AppValue.vSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username', style: context.textStyle.size14.black),
                AppValue.vSpaceTiny,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormFieldWidget(
                    controller: loginController.userNameEditController,
                    border: InputBorder.none,
                  ),
                ),
                AppValue.vSpaceSmall,
                Text('Password', style: context.textStyle.size14),
                AppValue.vSpaceTiny,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormFieldWidget(
                    controller: loginController.passwordEditController,
                    border: InputBorder.none,
                    isPasswordField: true,
                  ),
                ),
                AppValue.vSpaceSmall,
                Obx(
                  () => Text(
                    loginController.erroText.value,
                    style: context.textStyle.size12.w400.red,
                  ),
                ),
                AppValue.vSpaceSmall,
                SizedBox(
                  height: 50,
                  child: ButtonWidget(
                    onTap: loginController.onClickLogin,
                    text: 'Login',
                    primaryColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
