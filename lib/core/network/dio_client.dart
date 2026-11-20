import 'package:dio/dio.dart';

import '../storage/secure_storage.dart';
import 'api_endpoints.dart';

class DioClient {
  DioClient(this._storage, {this.onUnauthorized}) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // الـ endpoints العامة (login / register) مش محتاجة توكن
          if (!_isPublic(options.path)) {
            final token = await _storage.getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          // 401 على request محمي: التوكن خلص (5 دقايق) أو غلط
          final isProtected = !_isPublic(error.requestOptions.path);
          if (error.response?.statusCode == 401 && isProtected) {
            await _storage.clearToken();
            onUnauthorized?.call();
          }
          handler.next(error);
        },
      ),
    );
  }

  final SecureStorage _storage;

  /// بتتنده لما التوكن يبقى غير صالح (نرجّع الأم للـ Login)
  final void Function()? onUnauthorized;

  late final Dio dio;

  static const _publicPaths = [
    ApiEndpoints.login,
    ApiEndpoints.register,
  ];

  bool _isPublic(String path) => _publicPaths.contains(path);
}