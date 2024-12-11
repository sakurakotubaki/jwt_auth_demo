import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:jwt_auth_demo/core/api/api_client.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  static const _tokenKey = 'jwt_token';

  @override
  Future<User?> build() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    if (token == null) return null;

    try {
      return await _getApiClient().getCurrentUser();
    } catch (e) {
      await prefs.remove(_tokenKey);
      return null;
    }
  }

  ApiClient _getApiClient() {
    final dio = ref.watch(dioProvider);
    return ApiClient(dio);
  }

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();
    try {
      final response = await _getApiClient().login(username, password);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, response.accessToken);
      
      state = AsyncValue.data(await _getApiClient().getCurrentUser());
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> register(RegisterRequest request) async {
    state = const AsyncValue.loading();
    try {
      await _getApiClient().register(request);
      await login(request.username, request.password);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    state = const AsyncValue.data(null);
  }
}

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('jwt_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ),
  );
  
  return dio;
}
