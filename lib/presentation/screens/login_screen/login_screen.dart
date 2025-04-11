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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.blueGrey.shade900],
          ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppValue.vSpace(AppValue.paddingTop(context)),
                    AppValue.vSpace(AppValue.height(context) * 0.05),
                    const Icon(
                      Icons.lock_outline,
                      size: 80,
                      color: Colors.white,
                    ),
                    AppValue.vSpaceMedium,
                    Text(
                      'Welcome Back',
                      style: context.textStyle.size28.w600.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      'Sign in to continue',
                      style: context.textStyle.size16.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    AppValue.vSpaceSmall,
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: context.textStyle.size14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppValue.vSpaceTiny,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: TextFormFieldWidget(
                              controller:
                                  loginController.userNameEditController,
                              border: InputBorder.none,
                            ),
                          ),
                          AppValue.vSpaceSmall,
                          Text(
                            'Password',
                            style: context.textStyle.size14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppValue.vSpaceTiny,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: TextFormFieldWidget(
                              controller:
                                  loginController.passwordEditController,
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
                          AppValue.vSpaceMedium,
                          SizedBox(
                            height: 55,
                            child: ButtonWidget(
                              onTap: loginController.onClickLogin,
                              text: 'Sign In',
                              primaryColor: Colors.blueAccent,
                              textStyle: context.textStyle.size16.w600.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: context.textStyle.size14.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
