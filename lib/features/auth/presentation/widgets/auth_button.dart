import 'package:chat_u/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {

  final String buttonNameText;
  final VoidCallback onPressed;
  const AuthButton({super.key, required this.buttonNameText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: DefaultsColor.buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(25)
          ),
          padding: EdgeInsets.symmetric(vertical: 17)
      ),
      child: Text(
        buttonNameText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  }

