import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ServerRestHelper {
  final Dio _dio = DioClient().dio;
  final _storage = const FlutterSecureStorage();

  // -------------------------------
  // REGISTER RESTAURENTS
  // -------------------------------
  Future<int> postRest(
    String name,
    String email,
    String image,
    String role,
    String password,
    String long,
    String lat,
    String? description,
  ) async {
    try {
      final response = await _dio.post(
        '/restaurants',
        data: {
          "name": name,
          "email": email,
          "image": image,
          "password": password,
          "long": long,
          "lat": lat,
          "description": description,
        },
      );

      if (response.statusCode == 200) {
        print("Sucessful");
        return response.statusCode!;
      } else {
        print("Not sucessful");
        return response.statusCode!;
      }
    } catch (e) {
      print("-------------------------${e}--------------------------");
    }
    return 0;
  }

  // -------------------------------
  // LOGIN
  // -------------------------------
  Future<int> logRestIn(String email, String password) async {
    final response = await _dio.post(
      '/restaurants/login',
      data: {"email": email, "password": password},
    );

    print("---------------${response.data}----------------");

    final token = response.data['token'];
    await _storage.write(key: 'token', value: token);

    return response.statusCode ?? 0;
  }

  // -------------------------------
  // GET CURRENT RESTAURANTS
  // -------------------------------
  Future<Map<String, dynamic>> getUser() async {
    final response = await _dio.get('/restaurants/me');
    return response.data;
  }

  // -------------------------------
  // UPDATE RESTAURANTS PROPERTRIES
  // -------------------------------
  Future<bool> updateRest(Map<String, dynamic> updates) async {
    try {
      final response = await _dio.put('/restaurants/me', data: updates);

      return response.statusCode == 200;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
