import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL'] ?? "http://localhost:3000/api";

class AuthService {
  final http.Client client;

  AuthService({http.Client? httpClient}) : client = httpClient ?? http.Client();

  Future<bool> login(String username, String password) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }

  Future<bool> signup(
    String username,
    String password,
    String firstname,
    String lastname,
  ) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/users/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'firstname': firstname,
          'lastname': lastname,
        }),
      );
      return response.statusCode == 201;
    } catch (e) {
      throw Exception('Signup error: $e');
    }
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
