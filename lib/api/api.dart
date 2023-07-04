import 'package:dio/dio.dart';
// import 'package:cms/views/verification.dart';

final String baseURL = 'http://192.168.32.118/';
final baseOptions = BaseOptions(baseUrl: baseURL);

// class ApiSignup{
//    final Dio _dio = Dio();
//   final String baseURL = 'http://192.168.32.118/';
// final baseOptions = BaseOptions(baseUrl: baseURL);

// Future<Response> _registerUser(String emailController,String _passwordController, String user_name, String first_name,String last_name) async {
//   try {
//     final response = await _dio.post(
//       '${baseURL}registration/',
//       data: {
//         'email': emailController,
//         'password': _passwordController,
//         'username': user_name,
//         'first_name': first_name,
//         'last_name': last_name
//       },
//     );

//     // Process the response here (e.g., handle success or error messages)
//     print('Response Status Code: ${response.statusCode}');
//     print('Response Body: ${response.data}');
//   } catch (error) {
//     // Handle any errors that occurred during the registration process
//     print('Error occurred: $error');
//   }
// }
// }