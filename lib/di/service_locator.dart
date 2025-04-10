import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_date_source_impl.dart';
import 'package:base_project/data/repositories/user_repository_impl.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:base_project/domain/usercases/get_user_details.dart';
import 'package:base_project/domain/usercases/login_with_email_password.dart';
import 'package:base_project/presentation/screens/login_screen/login_controller.dart';
import 'package:base_project/presentation/screens/user_details_screen/user_controller.dart';
import 'package:base_project/presentation/view_models/user_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initApp() {
  locator
    ..registerLazySingleton(() => UserController(locator()))
    // View models
    ..registerLazySingleton(UserViewModel.new)
    // User cases
    ..registerLazySingleton(() => GetUserDetails(locator()))
    // Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator()))
    // Data sources
    ..registerLazySingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl.new)
    //
    ..registerLazySingleton(() => LoginController(locator()))
    ..registerLazySingleton(() => LoginWithEmailPassword(locator()));
}
