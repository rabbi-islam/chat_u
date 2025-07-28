import 'package:chat_u/chat_screen.dart';
import 'package:chat_u/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:chat_u/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_u/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_u/features/auth/domain/usecases/register_usecase.dart';
import 'package:chat_u/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_u/features/auth/presentation/pages/login_screen.dart';
import 'package:chat_u/features/conversation/data/datasources/conversation_remote_data_source.dart';
import 'package:chat_u/features/conversation/data/repositories/conversation_repositoy_impl.dart';
import 'package:chat_u/features/conversation/domain/usecases/fetch_conversation_use_case.dart';
import 'package:chat_u/features/conversation/presentation/bloc/conversation_bloc.dart';
import 'package:chat_u/features/conversation/presentation/pages/conversation_screen.dart';
import 'package:chat_u/features/auth/presentation/pages/register_screen.dart';
import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/domain/repositories/auth_repository.dart';

void main() {
  AuthRepositoryImpl authRepository = AuthRepositoryImpl(
    authRemoteDataSource: AuthRemoteDataSource(),
  );
  ConversationRepositoryImpl conversationRepositoryImpl = ConversationRepositoryImpl(dataSource: ConversationRemoteDataSource());
  runApp(
    MyApp(
      registerUseCase: RegisterUseCase(repository: authRepository),
      loginUseCase: LoginUseCase(repository: authRepository),
      fetchConversationUseCase: FetchConversationUseCase(repository: conversationRepositoryImpl),
    ),
  );
}

class MyApp extends StatelessWidget {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final FetchConversationUseCase fetchConversationUseCase;

  const MyApp({
    super.key,
    required this.registerUseCase,
    required this.loginUseCase,
    required this.fetchConversationUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            registerUseCase: registerUseCase,
            loginUseCase: loginUseCase,
          ),
        ),
        BlocProvider(create: (context) => ConversationBloc(fetchConversationUseCase)..add(FetchConversation())),
      ],
      child: MaterialApp(
        title: 'Chat-U',
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          '/register': (_) => RegisterScreen(),
          '/login': (_) => LoginScreen(),
          '/conversationScreen': (_) => ConversationScreen(),
        },
      ),
    );
  }
}
