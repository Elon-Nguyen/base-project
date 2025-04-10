import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_date_source_impl.dart';
import 'package:base_project/data/repositories/user_repository_impl.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:base_project/domain/usercases/get_user_details.dart';
import 'package:base_project/presentation/stores/user_store.dart';
import 'package:base_project/presentation/view_models/user_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initApp() {
  // State manager
  locator
    ..registerLazySingleton(() => UserStore(locator()))
    // View models
    ..registerLazySingleton(() => UserViewModel(locator()))
    // User cases
    ..registerLazySingleton(() => GetUserDetails(locator()))
    // Repositories
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(locator()))
    // Data sources
    ..registerLazySingleton<UserRemoteDataSource>(UserRemoteDataSourceImpl.new);
}
