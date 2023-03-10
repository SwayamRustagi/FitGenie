import 'package:fitgenie_project/Components/textField.dart';
import 'package:fitgenie_project/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitgenie_project/Components/textField.dart';
import 'package:fitgenie_project/Components/useButton.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              Image.asset(
                  'images/final logo.png',
              height: 150,
              ),
              SizedBox(height: 15),
              textField(hintText: 'New Username'),
              SizedBox(height: 15),
              textField(hintText: 'New Password'),
              SizedBox(height: 15),
              useButton(onPressed: (){}, buttonText: 'Register'),
              Padding(
                padding: EdgeInsets.only(left: 90, right: 40, top: 10),
                child: Row(
                  children: [
                    Text('Already Registered? '),
                    GestureDetector(
                      onTap: ()
                        {Navigator.pushNamed(context, LoginScreen.id);},
                      child: Text(
                          'Login Now',
                      style: TextStyle(
                        color: Colors.black,
                            fontWeight: FontWeight.w500
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
