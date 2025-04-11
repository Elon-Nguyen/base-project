abstract class SecureStorage {
  // Access token
  Future<void> writeAccessToken(String token);
  Future<String?> readAccessToken();
  Future<void> deleteAccessToken();

  // Refresh token
  Future<void> writeRefreshToken(String token);
  Future<String?> readRefreshToken();
  Future<void> deleteRefreshToken();

  // Optional: Xoá tất cả token
  Future<void> clearTokens();
}
