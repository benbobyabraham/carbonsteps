import 'package:flutter/material.dart';
// import 'package:nttgreen/components/button.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/components/input_fields.dart';
import 'package:nttgreen/components/square_tile.dart';
import 'package:nttgreen/screens/home/forgetpassword/otp_screen.dart';
import 'package:nttgreen/screens/home/login_page.dart';
import 'package:nttgreen/screens/home/register_page.dart';
import 'package:nttgreen/screens/quiz/questionnaire.dart';
import 'package:nttgreen/screens/home/onboarding_page.dart';
import 'package:nttgreen/screens/home/profile.dart';
import 'package:http/http.dart ';
import 'dart:convert';
import 'package:nttgreen/screens/home/location.dart';
import 'package:nttgreen/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/authentication_service.dart';

class LoginInitialPage extends StatelessWidget {
  LoginInitialPage({Key? key}) : super(key: key);
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 10),

                // logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/o3.png',
                    width: 260,
                    height: 260,
                  ),
                ),

                const SizedBox(height: 100),

                // login button

                // login button

                Container(
                  width: 350, // Set the desired width
                  child: Button2(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    buttonText: 'Login ',
                  ),
                ),

                const SizedBox(height: 20),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      // Expanded(
                      //   child: Divider(
                      //     thickness: 0.5,
                      //     color: Colors.grey[400],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        // child: Text(
                        //   '',
                        //   style: TextStyle(
                        //     color: Color.fromARGB(255, 101, 100, 100),
                        //     fontSize: 16,
                        //     // fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 131, 131, 131)),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Create a new account',
                        style: TextStyle(
                          color: Color.fromARGB(255, 6, 138, 92),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 255),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
