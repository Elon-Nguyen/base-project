abstract class SecureRepository {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> clearTokens();
}
