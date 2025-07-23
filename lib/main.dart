import 'package:chat_u/chat_screen.dart';
import 'package:chat_u/login_screen.dart';
import 'package:chat_u/message_screen.dart';
import 'package:chat_u/register_screen.dart';
import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat-U',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),

    );
  }
}

