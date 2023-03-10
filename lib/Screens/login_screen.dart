import 'package:fitgenie_project/Components/squareTile.dart';
import 'package:fitgenie_project/Components/textField.dart';
import 'package:fitgenie_project/Components/useButton.dart';
import 'package:fitgenie_project/Screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea (
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Image.asset('images/final logo.png',
              height: 100,
              ),
              SizedBox(height: 15),
              // Text('Welcome to FitGenie!',
              // style: TextStyle(
              //   fontWeight: FontWeight.bold,
              //   color: Colors.black,
              //   fontSize: 20,
              // ),
              // ),
              // SizedBox(height: 15),
              Text("Welcome back, you've been missed!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 15),
              textField(hintText: 'Username'),
              SizedBox(height: 15),
              textField(hintText: 'Password'),
              SizedBox(height: 12,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.grey[600],
                        fontSize: 10,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ),
              SizedBox(height:2),
              useButton(
                onPressed:(){},
                buttonText: 'Sign In',
              ),
              Padding(
                padding: EdgeInsets.only(left: 90, right: 40, top: 10),
                child: Row(
                  children: [
                    Text('Not Registered? '),
                    GestureDetector(
                      onTap: ()
                      {Navigator.pushNamed(context, RegistrationScreen.id);},
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black12,
                        ),
                    ),
                    Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('or Continue with',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.black12,
                  ),
                ),
                ],
              ),
        ),
        SizedBox(height: 10),
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonTile(imagePath: 'images/googleLogo.png'),
                  SizedBox(width: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
