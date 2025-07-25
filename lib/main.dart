import 'package:chat_u/chat_screen.dart';
import 'package:chat_u/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_u/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_u/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_u/features/auth/domain/usecases/register_usecase.dart';
import 'package:chat_u/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_u/features/auth/presentation/pages/login_screen.dart';
import 'package:chat_u/message_screen.dart';
import 'package:chat_u/features/auth/presentation/pages/register_screen.dart';
import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/domain/repositories/auth_repository.dart';

void main() {
  AuthRepositoryImpl repository = AuthRepositoryImpl(authRemoteDataSource: AuthRemoteDataSource());
  runApp( MyApp(registerUseCase: RegisterUseCase(repository: repository), loginUseCase: LoginUseCase(repository: repository),));
}

class MyApp extends StatelessWidget {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  const MyApp({super.key, required this.registerUseCase, required this.loginUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(registerUseCase: registerUseCase, loginUseCase: loginUseCase),
      child: MaterialApp(
        title: 'Chat-U',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: RegisterScreen(),
        routes: {
          '/register': (_) => RegisterScreen(),
          '/login': (_) => LoginScreen(),
          '/home': (_) => MessageScreen()
        },

      ),
    );
  }
}

