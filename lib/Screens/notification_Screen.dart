import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'main_screen.dart';

class NotificationScreen extends StatefulWidget {
  static String id = 'notification_screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            child: Column(
              children: [
                Image.asset('images/notifications.jpg'),
                Text('No new notifications!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
