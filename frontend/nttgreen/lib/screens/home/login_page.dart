import 'package:flutter/material.dart';
// import 'package:nttgreen/components/button.dart';
import 'package:nttgreen/components/button copy.dart';
import 'package:nttgreen/components/input_fields.dart';
import 'package:nttgreen/components/square_tile.dart';
import 'package:nttgreen/screens/home/forgetpassword/otp_screen.dart';
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

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // logo
                ClipOval(
                  child: Image.asset(
                    'assets/images/o2.png',
                    width: screenSize.width * 0.4, // Adjust as needed
                    height: screenSize.height * 0.4,
                  ),
                ),

                const SizedBox(height: 90),

                // welcome back, you've been missed!
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                Container(
                  width: screenSize.width * 0.8, // Adjust as needed
                  child: InputFields(
                    controller: usernameController,
                    hintText: "Enter Name",
                    obscureText: false,
                  ),
                ),

                const SizedBox(height: 30),

                // password textfield
                Container(
                  width: screenSize.width * 0.8, // Adjust as needed
                  child: InputFields(
                    controller: passwordController,
                    hintText: "Enter Password",
                    obscureText: true,
                  ),
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.1,
                      right: screenSize.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpScreen()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // login button
                Container(
                  width: screenSize.width * 0.7, // Adjust as needed
                  child: Button2(
                    onTap: () {
                      loginUser(context);
                    },
                    buttonText: 'Sign In ',
                  ),
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.05),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
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
                        'Register now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 172, 114),
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
      ),
    );
  }

  // sign user in method
  void loginUser(BuildContext context) async {
    final token =
        await userAuth(usernameController.text, passwordController.text);
    print(token);
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Credentials'),
          );
        },
      );
    }
  }
}
