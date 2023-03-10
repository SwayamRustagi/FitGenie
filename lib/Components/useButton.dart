import 'package:flutter/material.dart';

class useButton extends StatelessWidget {
  useButton({required this.onPressed, required this.buttonText});
  final VoidCallback onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets. only(left:25, bottom: 7, right: 25, top:10),
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
