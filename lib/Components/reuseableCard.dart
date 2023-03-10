import 'package:fitgenie_project/Components/miniUseButton.dart';
import 'package:flutter/material.dart';
import 'package:fitgenie_project/Components/miniUseButton.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard(
      {this.imagepath,
      this.decText,
      this.miniButtonText,
      this.miniButtonColor,
      this.description,
      this.whenPressed,
      this.imagePath2,
      this.color});
  final String? imagepath;
  final String? decText;
  final String? miniButtonText;
  final Color? miniButtonColor;
  final String? description;
  final VoidCallback? whenPressed;
  final String? imagePath2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: whenPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color!,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: const Offset(
                  1.0,
                  2.0,
                ),
                blurRadius: 3.5,
                spreadRadius: 1.5,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 2.0,
                spreadRadius: 1.25,
              ), //BoxShadow
            ],
          ),
          width: 250,
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    child: Image.asset(imagepath!),
                  ),
                  SizedBox(width: 10),
                  Center(
                    child: Text(
                      decText!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
