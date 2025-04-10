import 'package:base_project/di/service_locator.dart';
import 'package:base_project/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  UserDetailsScreen({super.key});
  final UserController userVM = locator<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: FutureBuilder(
        future: userVM.fetchUserDetails('1'),
        builder: (context, snapshot) {
          if (userVM.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userVM.user == null) {
            return const Center(child: Text('User not found'));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${userVM.user?.id ?? ""}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Name: ${userVM.user?.name ?? ""}',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Email: ${userVM.user?.email ?? ""}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
