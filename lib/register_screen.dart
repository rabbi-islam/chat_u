import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

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
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextInput('Username',Icons.person, _usernameController),
              SizedBox(height: 20,),
              _buildTextInput('Email',Icons.email, _emailController),
              SizedBox(height: 20,),
              _buildTextInput('Password',Icons.lock, _passwordController, isPassword: true),
              SizedBox(height: 20,),
              _buildRegisterButton(),
              SizedBox(height: 20,),
              _buildLoginPrompt()
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildTextInput(String hint, IconData icon, TextEditingController controller, {isPassword = false}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: DefaultsColor.sendMessageInput,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildRegisterButton(){
    return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultsColor.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(25)
          ),
          padding: EdgeInsets.symmetric(vertical: 17)
        ),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Widget _buildLoginPrompt() {
  return Center(
    child: GestureDetector(
      onTap: (){},
      child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(
                text: 'Click here to login',
                style: TextStyle(color: Colors.blueAccent),
              )
            ]
          )
      ),
    ),
  );
}















