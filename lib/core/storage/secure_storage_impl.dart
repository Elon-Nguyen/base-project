import 'package:base_project/core/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _keyAccessToken = 'access_token'; // env variable
  static const String _keyRefreshToken = 'refresh_token'; // env variable

  @override
  Future<void> writeAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  @override
  Future<String?> readAccessToken() async {
    return _storage.read(key: _keyAccessToken);
  }

  @override
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _keyAccessToken);
  }

  @override
  Future<void> writeRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  @override
  Future<String?> readRefreshToken() async {
    return _storage.read(key: _keyRefreshToken);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _keyRefreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([deleteAccessToken(), deleteRefreshToken()]);
  }
}
