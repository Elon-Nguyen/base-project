import 'package:base_project/presentation/constants/strings.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ConstString.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UserDetailsScreen(),
    );
  }
}
