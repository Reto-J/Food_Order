import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServerHelper {
  final Dio _dio = DioClient().dio;
  final _storage = const FlutterSecureStorage();

  // -------------------------------
  // REGISTER USER
  // -------------------------------
  Future<int> postUser(
    String name,
    String email,
    String image,
    String role,
    String password,
    String long,
    String lat,
  ) async {
    try {
      final response = await _dio.post(
        '/users',
        data: {
          "name": name,
          "email": email,
          "image": image,
          "role": role,
          "password": password,
          "long": long,
          "lat": lat,
        },
      );

      return response.statusCode ?? 0;
    } catch (e) {
      return 0;
    }
  }

  // -------------------------------
  // LOGIN
  // -------------------------------
  Future<int> logUserIn(String email, String password) async {
    final response = await _dio.post(
      '/users/login',
      data: {
        "email": email,
        "password": password,
      },
    );

    final token = response.data['token'];
    await _storage.write(key: 'token', value: token);

    return response.statusCode ?? 0;
  }

  // -------------------------------
  // GET CURRENT USER
  // -------------------------------
  Future<Map<String, dynamic>> getUser() async {
    final response = await _dio.get('/me');
    return response.data;
  }

  // -------------------------------
  // GET RESTAURANTS
  // -------------------------------
  Future<List<Map<String, dynamic>>> getRestaurants() async {
    final response = await _dio.get(
      '/users',
      queryParameters: {
        'route': 'Usertype.restaurant',
      },
    );

    return List<Map<String, dynamic>>.from(response.data);
  }
}
