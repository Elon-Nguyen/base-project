import 'package:base_project/di/service_locator.dart';
import 'package:base_project/presentation/view_models/user_view_model.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserViewModel userVM = locator<UserViewModel>();

  UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: FutureBuilder(
        future: userVM.fetchUserDetails("1"),
        builder: (context, snapshot) {
          if (userVM.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userVM.user == null) {
            return Center(child: Text('User not found'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${userVM.user?.id ?? ""}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Name: ${userVM.user?.name ?? ""}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Email: ${userVM.user?.email ?? ""}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
