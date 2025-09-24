import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/routes/app_routes.dart';
import '../models/post.dart';
import '../main.dart'; // for navigatorKey
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL'] ?? "http://localhost:3000/api";

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = "Unauthorized"]);
}

class ApiService {
  final http.Client client;

  ApiService({http.Client? httpClient}) : client = httpClient ?? http.Client();

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<List<Post>> fetchPosts() async {
    final String? token = await _getToken();
    final response = await client.get(
      Uri.parse('$baseUrl/posts'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 401) {
      await _handleUnauthorized();
      throw UnauthorizedException();
    }
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception("Failed to fetch posts: ${response.statusCode}");
    }
  }

  Future<void> createPost(String title, String description) async {
    final String? token = await _getToken();
    final response = await client.post(
      Uri.parse('$baseUrl/posts'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'title': title, 'description': description}),
    );
    if (response.statusCode == 401) {
      await _handleUnauthorized();
      throw UnauthorizedException();
    }
    if (response.statusCode != 201) {
      throw Exception('Failed to create post: ${response.statusCode}');
    }
  }

  Future<void> updatePost(int postId, String title, String description) async {
    final String? token = await _getToken();
    final response = await client.put(
      Uri.parse('$baseUrl/posts/$postId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'title': title, 'description': description}),
    );
    if (response.statusCode == 401) {
      await _handleUnauthorized();
      throw UnauthorizedException();
    }
    if (response.statusCode != 200) {
      throw Exception('Failed to update post: ${response.statusCode}');
    }
  }

  Future<void> deletePost(int postId) async {
    final String? token = await _getToken();
    final response = await client.delete(
      Uri.parse('$baseUrl/posts/$postId'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 401) {
      await _handleUnauthorized();
      throw UnauthorizedException();
    }
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post: ${response.statusCode}');
    }
  }

  Future<void> _handleUnauthorized() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.login,
      (route) => false,
    );
  }
}
