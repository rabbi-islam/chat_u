import 'package:bloc/bloc.dart';
import 'package:chat_u/features/auth/domain/usecases/login_usecase.dart';
import 'package:chat_u/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = FlutterSecureStorage();

  AuthBloc({required this.registerUseCase, required this.loginUseCase}) : super(AuthInitial()) {

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try{
        await registerUseCase(event.username, event.email, event.password);
        emit(AuthSuccess('Registration Successful'));
      }catch(e){
        emit(AuthFailure('Registration Failed'));
      }
    });


    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try{
        final user = await loginUseCase(event.email, event.password);
        _storage.write(key: 'token', value: user.token);
        print("token: ${user.token}");
        emit(AuthSuccess('Login Successful'));
      }catch(e){
        emit(AuthFailure('Login Failed'));
      }
    });
  }
}
