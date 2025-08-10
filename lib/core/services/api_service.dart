import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_model.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  // Login API
  static Future<AuthResponse> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return AuthResponse.fromJson(data);
      } else {
        return AuthResponse.withError('Login failed. Please check your credentials.');
      }
    } catch (e) {
      return AuthResponse.withError('Network error: $e');
    }
  }
}
