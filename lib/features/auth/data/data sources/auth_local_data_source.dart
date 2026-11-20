import '../../../../core/storage/secure_storage.dart';

class AuthLocalDataSource {
  AuthLocalDataSource(this._storage);

  final SecureStorage _storage;

  Future<void> saveToken(String token) => _storage.saveToken(token);

  Future<String?> getToken() => _storage.getToken();

  Future<bool> hasToken() => _storage.hasToken();

  Future<void> clearToken() => _storage.clearToken();
}