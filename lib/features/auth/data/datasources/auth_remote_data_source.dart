import 'dart:convert';

import 'package:chat_u/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final String BASE_URL = 'http://192.168.0.110:8080/auth';


  Future<UserModel> register({required String username, required String email, required String password,}) async {
    final response = await http.post(
        Uri.parse('$BASE_URL/register'),
        body: jsonEncode({'username': username,'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'}
    );

    return UserModel.fromJson(jsonDecode(response.body)['user']);
  }

  Future<UserModel> login({required String email, required String password,}) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'}
    );
    
    return UserModel.fromJson(jsonDecode(response.body)['user']);
  }
  
  
  
  
}
