import 'dart:convert';

import 'package:chat_u/features/auth/data/models/user_model.dart';
import 'package:chat_u/features/conversation/data/models/conversation_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ConversationRemoteDataSource {
  final String BASE_URL = 'http://192.168.0.110:8080';
  final _storage = FlutterSecureStorage();


  Future<List<ConversationModel>> fetchConversation() async {
    String token = await _storage.read(key: 'token') ?? '';
    final response = await http.get(
        Uri.parse('$BASE_URL/conversations'),
        headers: {'Authorization': 'Bearer $token'}
    );
    if(response.statusCode ==200){
      List data = jsonDecode(response.body);
      return data.map((json)=> ConversationModel.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load conversation.');
    }
  }


 }
