import 'package:flutter/material.dart';
// import 'package:nttgreen/screens/home/login_page.dart';
// import 'package:nttgreen/screens/home/onboarding_page.dart';
import 'package:nttgreen/screens/home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(), // Change this line to HomePage()
    );
  }
}
