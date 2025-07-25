import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {

  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const AuthInputField({super.key, required this.hint, required this.icon, required this.controller, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
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
}
