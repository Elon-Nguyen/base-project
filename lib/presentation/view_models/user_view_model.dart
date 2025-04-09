import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/presentation/stores/user_store.dart';

class UserViewModel {
  final UserStore userStore;

  UserViewModel(this.userStore);

  Future<void> fetchUserDetails(String userId) async {
    await userStore.fetchUserDetails(userId);
  }

  bool get isLoading => userStore.isLoading;
  User? get user => userStore.user;
}
