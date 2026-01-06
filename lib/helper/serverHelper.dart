import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ServerHelper {
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
      var url = Uri.parse("http://localhost:8000/api/reto/order/users");

      var response = await http.post(
        url,
        body: {
          "name": name,
          "email": email,
          "image": image,
          "role": role,
          "password": password,
          "long": long,
          "lat": lat,
        },
      );
      if (response.statusCode == 200) {
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString("userId", response.body);
        print("Sucessful");
        return response.statusCode;
      } else {
        print("Not sucessful");
      }
    } catch (e) {
      print(e);
    }

    return 0;
  }

  Future<List<Map<String, dynamic>>> getRestaurants() async {
  final url = Uri.parse(
    "http://localhost:8000/api/reto/order/users?route:Usertype.restaurant",
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> decoded =
        jsonDecode(response.body) as List<dynamic>;

    return decoded
        .map((item) => item as Map<String, dynamic>)
        .toList();
  } else {
    return [];
  }
}


  Future<int> logUserIn(String email, String password) async {
    var url = Uri.parse("http://localhost:8000/api/reto/order/users/login");

    var response = await http.post(
      url,
      body: {"email": email, "password": password},
    );

    final data = jsonDecode(response.body);
    String userId = data["_id"];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userId", userId);

    return response.statusCode;
  }

  Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId")!;

    var url = Uri.parse("http://localhost:8000/api/reto/order/users/$userId");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> user =
          jsonDecode(response.body) as Map<String, dynamic>;

      return user;
    } else {
      return {};
    }
  }
}
