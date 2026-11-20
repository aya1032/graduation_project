import 'package:aman_graduation_broject/features/auth/data/model/login_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/register_request_model.dart';
import 'package:aman_graduation_broject/features/auth/data/model/user_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';


class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  /// POST /api/auth/login  →  بيرجّع التوكن
  /// الرد: { success, message, data: { token } }
  Future<String> login(LoginRequestModel request) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    return response.data['data']['token'] as String;
  }

  /// POST /api/auth/register  →  بيرجّع بيانات المستخدم
  /// الرد: { success, message, data: { userData: {...} } }
  Future<UserModel> register(RegisterRequestModel request) async {
    final response = await _dio.post(
      ApiEndpoints.register,
      data: request.toJson(),
    );

    return UserModel.fromJson(
      response.data['data']['userData'] as Map<String, dynamic>,
    );
  }
}