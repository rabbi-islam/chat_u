import 'package:chat_u/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_prompt_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(hint: 'Email',
                  icon: Icons.email,
                  controller: _emailController),
              SizedBox(height: 20,),
              AuthInputField(hint: 'Password',
                  icon: Icons.lock,
                  controller: _passwordController,
                  isPassword: true),
              SizedBox(height: 20,),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state is AuthSuccess){
                    Navigator.pushNamed(context, '/home');

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login success")));
                  }else if(state is AuthFailure){
                    debugPrint(state.failureMessage);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failureMessage)));
                  }
                },
                builder: (context, state) {
                  if(state is AuthLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  return AuthButton(
                    buttonNameText: 'Login',
                    onPressed: () {
                      context.read<AuthBloc>().add(LoginEvent(_emailController.text, _passwordController.text));
                    },
                  );
                },
              ),
              SizedBox(height: 20,),
              AuthPromptText(title: 'Don\'t have an account? ',
                  subtitle: 'Click here to register',
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }

}















