import 'package:base_project/domain/entities/user.dart';
import 'package:base_project/domain/usercases/get_user_details.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final GetUserDetails getUserDetails;

  _UserStore(this.getUserDetails);

  @observable
  User? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchUserDetails(String userId) async {
    isLoading = true;
    try {
      user = (await getUserDetails.execute(userId)) as User?;
    } catch (e) {
      user = null;
    } finally {
      isLoading = false;
    }
  }
}
