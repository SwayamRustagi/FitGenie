
import 'package:fitgenie_project/Screens/main_screen.dart';
import 'package:fitgenie_project/Screens/notification_Screen.dart';
import 'package:fitgenie_project/Screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitgenie_project/Screens/login_screen.dart';
import 'package:fitgenie_project/Features/WaterIntake/waterIntakeScreen.dart';
import 'package:fitgenie_project/Features/WorkoutTracker/WorkoutTrackerPage.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Features/WorkoutTracker/workoutData.dart';

void main() async{
  //initailizing hive
  await Hive.initFlutter();
  //open a hive box/database
  await Hive.openBox('workout_database1');
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<WorkoutData>(
    create: (_) => WorkoutData(),
    ),
  ],      child: FitGenie(),
  ));
}

class FitGenie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainPage.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MainPage.id: (context) => MainPage(),
        WaterIntakeSystem.id: (context) => WaterIntakeSystem(),
        WorkoutTrackerPage.id: (context) => WorkoutTrackerPage(),
        NotificationScreen.id: (context) => NotificationScreen(),
      },
    );
  }
}
