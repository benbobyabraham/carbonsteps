import 'package:flutter/material.dart';
import 'package:nttgreen/screens/home/login_page.dart';
import 'package:nttgreen/screens/home/login_initial.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., 2 seconds) to display the splash screen.
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen (your main page).
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginInitialPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Display your splash screen image here.
        child: Padding(
          padding: EdgeInsets.only(bottom: 250),
          child: ClipOval(
            child: Image.asset(
              'assets/images/o3.png',
              width: 260,
              height: 260,
            ),
          ),
        ),
      ),
    );
  }
}
