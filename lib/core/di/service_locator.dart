import 'package:base_project/core/data/datasources/secure_data_source/secure_storage.dart';
import 'package:base_project/core/data/datasources/secure_data_source/secure_storage_impl.dart';
import 'package:base_project/core/data/repositories/secure_repository_impl.dart';
import 'package:base_project/core/data/repositories/user_repository_impl.dart';
import 'package:base_project/core/domain/repositories/secure_repository.dart';
import 'package:base_project/core/domain/repositories/user_repository.dart';
import 'package:base_project/features/auth/domain/usecasees/login_with_email_password.dart';
import 'package:base_project/features/auth/domain/usecasees/save_tokens.dart';
import 'package:base_project/features/auth/presentation/screens/login_screen/login_controller.dart';
import 'package:base_project/features/user/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/features/user/data/datasources/user_remote_data_source/user_remote_date_source_impl.dart';
import 'package:base_project/features/user/domain/usecases/get_user_details.dart';
import 'package:base_project/features/user/presentation/screens/user_details_screen/user_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initApp() {
  locator
    ..registerLazySingleton(() => UserController(locator()))
    // User cases
    ..registerLazySingleton(() => GetUserDetails(locator()))
    // Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator()))
    // Data sources
    ..registerLazySingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl.new)
    //
    ..registerLazySingleton<SecureStorage>(SecureStorageImpl.new)
    ..registerLazySingleton<SecureRepository>(
      () => SecureRepositoryImpl(locator()),
    )
    ..registerLazySingleton(() => SaveTokens(locator()))
    ..registerLazySingleton(() => LoginWithEmailPassword(locator()))
    ..registerLazySingleton(() => LoginController(locator(), locator()));
}
