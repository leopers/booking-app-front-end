import 'dart:convert';
import 'package:apps/features/authentication/screens/login/login.dart';
import 'package:apps/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static const String _baseUrl = 'http://127.0.0.1:8080/api';

  // GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _buildHeaders(token),
    );
    return _handleResponse(response);
  }

  // POST request
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _buildHeaders(token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final token = await _getToken();
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _buildHeaders(token),
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _buildHeaders(token),
    );
    return _handleResponse(response);
  }

  // Build headers with token
  static Map<String, String> _buildHeaders(String? token) {
    final headers = {'Content-Type': 'application/json'};
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  // Get token from local storage
  static Future<String?> _getToken() async {
    return LocalStorage().readData<String>('token');
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    final responseBody = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;

      // Token expired
    } else if (response.statusCode == 401) {
      LocalStorage().removeData('token');
      Get.offAll(() => const LoginScreen());
      throw Exception('Session expired. Please log in again.');
    } else {
      throw Exception(responseBody['message'] ?? 'Failed to load data');
    }
  }
}
