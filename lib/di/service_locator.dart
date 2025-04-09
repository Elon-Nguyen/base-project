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
  locator.registerLazySingleton(() => UserStore(locator()));
  
  locator.registerLazySingleton(() => UserViewModel(locator()));
  
  locator.registerLazySingleton(() => GetUserDetails(locator()));
  
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl( locator()));

  locator.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
}