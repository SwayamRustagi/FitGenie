import 'package:flutter/material.dart';

class miniUseButton extends StatelessWidget {
  miniUseButton({required this.onPressed, required this.buttonText});
  final VoidCallback onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(80),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child:
        Center(
          child: Text(buttonText!,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
