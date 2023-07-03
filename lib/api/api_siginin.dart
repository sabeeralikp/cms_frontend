import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'http://192.168.32.118/'; // Replace with your API base URL

  Future<Response> signIn(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/signin', // Replace with your sign-in API endpoint
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (error) {
      throw Exception('Failed to sign in: $error');
    }
  }
}
