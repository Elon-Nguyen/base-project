import 'package:base_project/presentation/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class UserDetailsScreen extends StatelessWidget {
  final UserViewModel userViewModel = GetIt.I<UserViewModel>();

  UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details")),
      body: FutureBuilder(
        future: userViewModel.fetchUserDetails("user-id"),
        builder: (context, snapshot) {
          if (userViewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (userViewModel.user == null) {
            return Center(child: Text('User not found'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${userViewModel.user?.id ?? ""}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Name: ${userViewModel.user?.name ?? ""}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Email: ${userViewModel.user?.email ?? ""}',
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
