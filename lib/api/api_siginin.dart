// import 'package:cms/views/Index.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl =
      'http://127.0.0.1:8000/'; // Replace with your API base URL
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<Response> signIn(String userName, String password) async {
    try {
      final response = await _dio.post(
        '{$baseUrl}api/token/', // Replace with your sign-in API endpoint
        data: {'email': userName, 'password': password},
      );

      // Store access token securely
      final accessToken = response.data['access_token'];
      await _secureStorage.write(key: 'access_token', value: accessToken);

      // Navigate to the home screen
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => IndexPage()),
      // );

      return response;
    } catch (error) {
      // showDialog(
      //   context: context ,
      //   builder: (context) => AlertDialog(
      //     title: Text('Login Failed'),
      //     content: Text('Invalid username or password.'),
      //     actions: [
      //       TextButton(
      //         child: Text('OK'),
      //         onPressed: () => Navigator.of(context).pop(),
      //       ),
      //     ],
      //   ),
      // );
      throw Exception('Failed to sign in: $error');
    }
  }
}
