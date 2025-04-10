import 'package:base_project/presentation/constants/router_name.dart';
import 'package:base_project/presentation/constants/strings.dart';
import 'package:base_project/presentation/screens/home_screen/home_screen.dart';
import 'package:base_project/presentation/screens/login/login_screen.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouterName.login,
      getPages: [
        GetPage(
          name: RouterName.home,
          page: () => const HomeScreen(title: 'Home Page'),
        ),
        GetPage(name: RouterName.userDetail, page: UserDetailsScreen.new),
        GetPage(name: RouterName.login, page: LoginScreen.new),
      ],
    );
  }
}
