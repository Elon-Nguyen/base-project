import 'package:base_project/data/datasources/user_remote_data_source/user_remote_data_source.dart';
import 'package:base_project/data/datasources/user_remote_data_source/user_remote_date_source_impl.dart';
import 'package:base_project/data/repositories/user_repository_impl.dart';
import 'package:base_project/domain/repositories/user_repository.dart';
import 'package:base_project/domain/usercases/get_user_details.dart';
import 'package:base_project/presentation/stores/user_store.dart';
import 'package:base_project/presentation/viewmodels/user_viewmodel.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void initApp() {
  getIt.registerLazySingleton(() => UserStore(getIt()));
  
  getIt.registerLazySingleton(() => UserViewModel(getIt()));
  
  getIt.registerLazySingleton(() => GetUserDetails(getIt()));
  
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl( getIt()));

  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl());
}