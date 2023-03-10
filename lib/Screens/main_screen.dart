import 'package:fitgenie_project/Features/WaterIntake/waterIntakeScreen.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/WorkoutTrackerPage.dart';
import 'package:fitgenie_project/Screens/notification_Screen.dart';
import 'package:flutter/material.dart';
import 'package:fitgenie_project/Components/reuseableCard.dart';
import 'package:fitgenie_project/Components/miniUseButton.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:fitgenie_project/Features/WaterIntake/longReuseableCard.dart';
class MainPage extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List activity = [
    ['images/1.png', 'CALORIC\nREQUIREMENT','Weight gain  or loss, you gotta\n  know your maintainance\n  calories!' ],
    ['images/3.png', 'WORKOUT\nTRACKER',"Who does'nt wanna stay fit?\n  Exercise is a crucial\n  part of our day." ],
    ['images/2.png', 'BMI\nCALCULATOR', "Curious about your body\n status? knowing your BMI  is\n  important" ],
    ['images/4.png', 'CALORIE\nTRACKING', 'Eating is fun!, but calories are\nimportant too, for your\nweight management']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            gap: 7,
            tabs:[
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed:(){
                  Navigator.pushNamed(context, MainPage.id);
                },
              ),
              GButton(
                  icon: Icons.chat_bubble,
              text: 'FitGuru',
              ),
              GButton(
                  icon: Icons.notifications_active,
              text: 'Notifications',
                onPressed: (){
                    Navigator.pushNamed(context, NotificationScreen.id);
                },
              ),
              GButton(
                  icon: Icons.account_circle,
              text: 'Acoount',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
             SizedBox(height: 75),
            Padding(
              padding: EdgeInsets.only(left: 15) ,
              child: Container(
                height: 40,
                child: Image.asset('images/final logo.png'),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Welcome Back, Swayam',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                  'Discover',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              ),
            ),
            // SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ReuseableCard(
                   description: 'Weight gain  or loss, you gotta know your maintainance calories!',
                    imagepath: 'images/caloriecalc.png',
                    decText: 'CALORIC\nNEED',
                    // imagePath2: 'images/track1.png',
                    whenPressed: (){
                     print('pressed');
                    },
                    color: Colors.white,
                  ),
                  ReuseableCard(
                    // description: "",
                    imagepath: 'images/bmi.jpg',
                    decText: 'BMI',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Explore Trackers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ReuseableCard(
                    description: "Who does'nt wanna stay fit? Exercise is a crucial thing!",
                    imagepath: 'images/workout.jpg',
                    decText: 'WORKOUT\nTRACKER',
                    color: Colors.white,
                    whenPressed: (){
                      Navigator.pushNamed(context, WorkoutTrackerPage.id);
                    },
                  ),
                  ReuseableCard(
                    description: 'Eating is fun!, but counting its calories is important too! ',
                    imagepath: 'images/calorie.jpg',
                    decText: 'CALORIE\nTRACKING',
                    color: Colors.white,
                  ),
                  ReuseableCard(
                    description: 'Eating is fun!, but counting its calories is important too! ',
                    imagepath: 'images/HABIT.jpg',
                    decText: 'HABIT\nTRACKER',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              child: Column(
                children: <Widget>[
                  longReuseableCard(
                    description: "",
                    imagepath: 'images/waterintake.png',
                    decText: '  Glasses Consumed: 4',
                    whenPressed: (){
                      Navigator.pushNamed(context, WaterIntakeSystem.id);
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
