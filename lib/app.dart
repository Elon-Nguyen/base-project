import 'package:flutter/material.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_details_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UserDetailsScreen(),
    );
  }
}
