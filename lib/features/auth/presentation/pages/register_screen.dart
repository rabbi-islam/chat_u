import 'package:chat_u/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_u/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_u/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:chat_u/features/auth/presentation/widgets/auth_prompt_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
              AuthInputField(
                hint: 'Username',
                icon: Icons.person,
                controller: _usernameController,
              ),
              SizedBox(height: 20),
              AuthInputField(
                hint: 'Email',
                icon: Icons.email,
                controller: _emailController,
              ),
              SizedBox(height: 20),
              AuthInputField(
                hint: 'Password',
                icon: Icons.lock,
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state is AuthSuccess){
                    Navigator.pushNamed(context, '/login');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register success")));
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
                    buttonNameText: 'Register',
                    onPressed: () {
                      context.read<AuthBloc>().add(RegisterEvent(_usernameController.text, _emailController.text, _passwordController.text));
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              AuthPromptText(
                title: 'Already have an account? ',
                subtitle: 'Click here to login',
                onTap: ()=> Navigator.pushNamed(context, '/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
