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
      final result = await getUserDetails.execute(userId);

      result.fold(
        (error) => print('Lỗi: $error'),
        (usert) {
          print('User: ${usert.name}');
          user = usert;
        },
      );
    } catch (e) {
      user = null;
    } finally {
      isLoading = false;
    }
  }
}
