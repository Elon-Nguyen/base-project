import 'package:base_project/data/datasources/secure_data_source/secure_storage.dart';
import 'package:base_project/domain/repositories/secure_repository.dart';

class SecureRepositoryImpl implements SecureRepository {
  final SecureStorage secureStorage;

  SecureRepositoryImpl(this.secureStorage);

  @override
  Future<void> saveAccessToken(String token) async {
    await secureStorage.writeAccessToken(token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await secureStorage.writeRefreshToken(token);
  }

  @override
  Future<void> clearTokens() async {
    await secureStorage.clearTokens();
  }
}
